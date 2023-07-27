//
//  EpisodeRow.swift
//  Purple
//
//  Created by Work on 27.07.2023.
//

import SwiftUI

struct EpisodeRow: View {
    var episode: Episode
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "play.fill")
                    .foregroundColor(.purple)
                Text("\(episode.episode) - \(episode.name)")
                    .font(.headline)
            }
            .padding(.horizontal)
            
            Text("Air Date: \(episode.airDate)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
        .padding(.vertical, 4)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
        
    }
}
