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
                    Divider()
                        .padding(.horizontal)
                    
                    Text("Episodes")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ForEach(character.episode) { episode in
                        EpisodeRow(episode: episode)
                    }
                    
                    
                    //                    VStack(alignment: .leading){
                    //
                    //                        HStack{
                    //                            VStack(alignment: .leading){
                    //                                InfoRow(label: "Status", icon: "circle.fill", value: character.status)
                    //                                InfoRow(label: "Species", icon: "star.circle.fill", value: character.species)
                    //                            }
                    //                        }
                    //                        HStack{
                    //                            VStack(alignment: .trailing){
                    //                                if let type = character.type {
                    //                                    InfoRow(label: "Type", icon: "person.circle.fill", value: type)
                    //                                }
                    //
                    //                                if let gender = character.gender {
                    //                                    InfoRow(label: "Gender", icon: "person.crop.circle.fill", value: gender)
                    //                                }
                    //                            }
                    //                        }
                    //
                    //                    }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                    
                    //-----END INFO-----
                    
                    
                }
            }.onAppear{
                viewModel.getCharacterDetail()
            }
        }
        
        //        ScrollView{
        //            VStack(alignment: .leading) {
        //                if let character = viewModel.character {
        //                    CharactersImage(urlString: character.image)
        //                        .aspectRatio(contentMode: .fit)
        //                        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //                        .overlay {
        //                            HStack(spacing: 0){
        //                                Circle().foregroundColor(colorForStatus()).frame(width: 15, height: 15, alignment: .trailing).padding(.leading,8)
        //
        //                                Text(character.name).font(.caption)
        //                                    .foregroundColor(.white)
        //                                    .padding(.horizontal, 8)
        //                                    .padding(.vertical, 4)
        //                                    .minimumScaleFactor(0.5)
        //                            }.background(.black).cornerRadius(12).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        //
        //                        }
        //
        //                    VStack(alignment: .leading, spacing: 8) {
        //                        Text(character.name)
        //                            .font(.title)
        //                            .fontWeight(.bold)
        //
        //                        HStack {
        //                            Text("Status:")
        //                                .fontWeight(.semibold)
        //                            Text(character.status)
        //                        }
        //
        //                        HStack {
        //                            Text("Species:")
        //                                .fontWeight(.semibold)
        //                            Text(character.species)
        //                        }
        //
        //                        if let type = character.type {
        //                            HStack {
        //                                Text("Type:")
        //                                    .fontWeight(.semibold)
        //                                Text(type)
        //                            }
        //                        }
        //
        //                        if let gender = character.gender {
        //                            HStack {
        //                                Text("Gender:")
        //                                    .fontWeight(.semibold)
        //                                Text(gender)
        //                            }
        //                        }
        //                    }
        //                    .padding(.horizontal)
        //
        //                    Divider()
        //                        .padding(.horizontal)
        //
        //                    VStack(alignment: .leading, spacing: 8) {
        //                        Text("Episodes")
        //                            .font(.title)
        //                            .fontWeight(.bold)
        //                            .padding(.horizontal)
        //
        //                        ForEach(character.episode) { episode in
        //                            VStack(alignment: .leading) {
        //                                Text("\(episode.episode) - \(episode.name)")
        //                                    .font(.headline)
        //                                    .padding(.horizontal)
        //
        //                                Text("Air Date: \(episode.airDate)")
        //                                    .font(.subheadline)
        //                                    .foregroundColor(.gray)
        //                                    .padding(.horizontal)
        //                            }
        //                        }
        //                    }
        //                    .padding(.top)
        //                } else {
        //                    ProgressView()
        //                        .progressViewStyle(CircularProgressViewStyle(tint: .purple))
        //                        .padding(.top, 20)
        //                }
        //
        //                Spacer()
        //            }
        //            .onAppear {
        //                viewModel.getCharacterDetail()
        //            }
        //        }
        
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

// Custom Info Row
struct InfoRow: View {
    var label: String
    var icon: String
    var value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.brandPrimary)
            Text(label + ":")
                .fontWeight(.semibold)
            Text(value)
        }
        
    }
}
// Custom Episode Row
struct EpisodeRow: View {
    var episode: Episode
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "play.fill") // YouTube icon (you can customize it)
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
        .padding(.vertical, 4) // Add vertical padding to separate each row
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
        
    }
}
