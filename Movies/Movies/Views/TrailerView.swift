//
//  TrailerView.swift
//  Movies
//
//  Created by Marc on 22/06/2023.
//

import SwiftUI
import WebKit

struct TrailerView: View {
    let videoID: String
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                VideoView(videoID: videoID)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct VideoView: UIViewRepresentable {
    let videoID: String
    private let url = "https://www.youtube.com/embed/"
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let VideoURL = URL(string: "\(url)\(videoID)") else {
            return
        }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: VideoURL))
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView(videoID: "qEVUtrk8_B4")
    }
}
