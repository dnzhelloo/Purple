//
//  CharacterCardView.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import SwiftUI

struct CharacterCardView: View {
    let character: Character
    
    var body: some View {
        ZStack(){
            CharactersImage(urlString: character.image)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .frame(height: 150)
                .overlay(
                    Text(character.name)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.black.opacity(1))
                        .cornerRadius(12)
                        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottomTrailing)
                )
        }
        .cornerRadius(12)
        
    }
}
