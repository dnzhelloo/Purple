//
//  CharacterRowCell.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import SwiftUI

struct CharacterRowCell: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 16) {
            CharactersImage(urlString: character.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(12)
                .overlay {
                    Circle().foregroundColor(colorForStatus()).position(x: 15,y:0).frame(width: 15, height: 15, alignment: .trailing)
                        
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        
                }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .foregroundColor(Color(uiColor: .label))
                
                Text(character.species)
                    .font(.subheadline)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(Color(uiColor: .label))
        }
        .padding(8)
        .background(Color(uiColor: .systemBackground))
        .cornerRadius(12)
        .shadow(color: Color(uiColor: .systemGray2).opacity(0.7), radius: 4, x: 0, y: 2)
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

