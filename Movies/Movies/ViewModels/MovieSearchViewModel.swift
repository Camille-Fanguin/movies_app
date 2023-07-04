//
//  MovieSearchViewModel.swift
//  Movies
//
//  Created by yves on 26/06/2023.
//

import Foundation

class MovieSearchViewModel: ObservableObject {
    internal init(movieDetails: [AirTableSecondFloor]? = [], movieSearched: [AirTableSecondFloor]? = [], movies: [MovieVD] = []) {
        self.movieDetails = movieDetails
        self.movieSearched = movieSearched
        self.movies = movies
    }
    
    
    @Published var movieDetails:[AirTableSecondFloor]? = []
    @Published var movieSearched:[AirTableSecondFloor]? = []
    @Published var movies:[MovieVD] = []
    
    private let endpoint = "https://api.themoviedb.org/3"
    private let language = "fr-FR"
    
    func getPopularMovies() async {
        print("coucou")
        guard let url = URL(string: "\(endpoint)/movie/popular?api_key=\(apiKey)&language=\(language)") else {
            print("hello")
            
            return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let decoded = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                print("erreur")
                return }
                        self.movies = decoded.results
            print(movies.count)
        } catch {
            print("Error")
        }
    }
    
    func fetchMovies() async {
        let apikey = "keyro44SJvXTIfPNs"
        let urlOfAirtableMovie = "https://api.airtable.com/v0/appTT0t4FupHVTbOf/tbl2qpwiUFVeocVFW"
        var request = URLRequest(url: URL(string:urlOfAirtableMovie)!)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField:"Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                // Enregistre AirtableSearchResult dans les données capturées dans self.movieDetails
                if let AirtableSearchResult = try decoder.decode(MovieResponse?.self, from: data){
                    print(type(of: AirtableSearchResult))
                    self.movieDetails = AirtableSearchResult.records
                }
                
            }catch{
                print(error)
            }
        } catch{
            print("data invalid")
        }
    }
    struct Record: Codable {
        let records: [AirTableSecondFloor]
    }
    
    // func for add a Movie
//    func addMovie() async {
//
//        var movieDetail = AirTableSecondFloor(fields: JSONInfo(title: "Astérix et les jeux olympiques", year: "2008"))
//        print(movieDetail)
//        let apikey = ""
//        if let url = URL(string: "https://api.airtable.com/v0/appTT0t4FupHVTbOf/movies"){
//            do {
//                var request = URLRequest(url: url)
//                request.httpMethod = "POST"
//                request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
//                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//                let jsonMovie = try JSONEncoder().encode(movieDetail)
//
//                request.httpBody = jsonMovie
//                // for debug
//                if let Jdata = try JSONSerialization.jsonObject(with: jsonMovie) as? [String:Any]{
//                    print("Encoded Data \(Jdata)")
//                }
//                // handle response
//                let (data, response) = try await URLSession.shared.data(for: request)
//                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
//                    print("All OK")
//                    // update movies list
//                    await fetchMovies()
//                }
//            } catch {
//                print("Invalid data")
//            }
//        }
//    }
    
    func searchMovies(movieToSearch: String) async -> [AirTableSecondFloor]?{
        let movies = movieDetails;
        do {
            try? await self.fetchMovies()
            if let movies {
                print(type(of: movies))
                //print(movies)
                self.movieSearched = movies.filter{ $0.fields.title.contains(movieToSearch) || $0.fields.year.contains(movieToSearch) }
                return self.movieSearched
            }
        } catch {
            print(error)
        }
        
        return []
    }
    
    
    
}
