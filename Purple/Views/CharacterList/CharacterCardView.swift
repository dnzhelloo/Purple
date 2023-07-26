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
                .frame(height: 150).overlay {
                    HStack(spacing: 0){
                        Circle().foregroundColor(colorForStatus()).frame(width: 15, height: 15, alignment: .trailing).padding(.leading,8)
                        
                        Text(character.name).font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .minimumScaleFactor(0.5)
                    }.background(.black).cornerRadius(12).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            
        }
        .cornerRadius(12)
    }
    
    private func colorForStatus() -> Color {
        switch character.status {
            case "Unknown":
                return Color.gray
            case "Alive":
                return Color.green
            case "Dead":
                return Color.red
            default:
                return Color.gray
        }
    }
}
