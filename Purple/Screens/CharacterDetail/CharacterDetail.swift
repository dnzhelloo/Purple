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
            VStack(alignment: .leading, spacing: 16) {
                if let character = viewModel.character {
                    CharactersImage(urlString: character.image)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        .shadow(radius: 10)
                        .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(character.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("Status:")
                                .fontWeight(.semibold)
                            Text(character.status)
                        }
                        
                        HStack {
                            Text("Species:")
                                .fontWeight(.semibold)
                            Text(character.species)
                        }
                        
                        if let type = character.type {
                            HStack {
                                Text("Type:")
                                    .fontWeight(.semibold)
                                Text(type)
                            }
                        }
                        
                        if let gender = character.gender {
                            HStack {
                                Text("Gender:")
                                    .fontWeight(.semibold)
                                Text(gender)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Episodes")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ForEach(character.episode) { episode in
                            VStack(alignment: .leading) {
                                Text("\(episode.episode) - \(episode.name)")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                Text("Air Date: \(episode.airDate)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                        .padding(.top, 20)
                }
                
                Spacer()
            }
            .navigationTitle("Character Detail")
            .onAppear {
                viewModel.getCharacterDetail()
            }
        }
       
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(characterID: "1")
    }
}
