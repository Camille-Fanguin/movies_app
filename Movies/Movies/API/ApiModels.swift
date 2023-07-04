//
//  ApiModels.swift
//  Movies
//
//  Created by yves on 26/06/2023.
//

import Foundation

struct MovieResponse: Codable {
    let records: [AirTableSecondFloor]
    
    var movies: [JSONInfo] {
        return records.map { rec in
            var record = rec.fields
            record.id = rec.id ?? "AOZIEJAZF"
            return record
                //}
        }
    }
    
}

struct AirTableSecondFloor: Codable, Identifiable {
    
    var id: String?
    //let createdTime: String
    let fields: JSONInfo
        
}
