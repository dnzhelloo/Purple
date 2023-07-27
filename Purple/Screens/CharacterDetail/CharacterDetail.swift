//
//  CharacterDetail.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterDetail: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    init(characterID: RickAndMortyAPI.ID) {
        _viewModel = StateObject(wrappedValue: CharacterDetailViewModel(characterID: characterID))
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                if let character = viewModel.character{
                    
                    //----Image---
                    CharactersImage(urlString: character.image)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay {
                            HStack(spacing: 0){
                                Circle().foregroundColor(colorForStatus()).frame(width: 15, height: 15, alignment: .trailing).padding(.leading,8)
                                
                                Text(character.name).font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .minimumScaleFactor(0.5)
                            }.background(.black).cornerRadius(12).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        }
                    //-----END Image----
                    
                    //--------Info--------
                    Text("Details")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal,12)
                        .padding(.top,8)
                    HStack{
                        HStack{
                            VStack(alignment: .leading,spacing: 12){
                                InfoRow(label: "Status", icon: "circle.fill", value: character.status)
                                
                                InfoRow(label: "Species", icon: "star.circle.fill", value: character.species)
                            }
                            Spacer()
                            VStack(alignment: .leading,spacing: 12){
                                if let type = character.type {
                                    InfoRow(label: "Type", icon: "person.circle.fill", value: type)
                                }
                                if let gender = character.gender {
                                    InfoRow(label: "Gender", icon: "person.crop.circle.fill", value: gender)
                                }
                            }
                        }.padding(.horizontal,12)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    //-------END Info------
                    
                    Divider().padding(.horizontal)
                    
                    //----Start Episode------
                    Text("Episodes")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ForEach(character.episode) { episode in
                        EpisodeRow(episode: episode)
                    }
                    //----END Episode ------
                }
            }.onAppear{
                viewModel.getCharacterDetail()
            }
        }
    }
    
    private func colorForStatus() -> Color {
        switch viewModel.character?.status {
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

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(characterID: "1")
    }
}
