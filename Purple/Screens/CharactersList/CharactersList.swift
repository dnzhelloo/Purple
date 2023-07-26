//
//  CharactersList.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import SwiftUI

struct CharactersList: View {
    @StateObject var viewModel = CharactersListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading){
                    
                    //CardView
                    VStack(alignment: .leading){
                        Text("Topics ").font(.headline)
                        Spacer(minLength: 12)
                        ScrollView(.horizontal,showsIndicators: false){
                            LazyHStack{
                                ForEach(viewModel.firstFiveCharacter) { character in
                                    NavigationLink {
                                        CharacterDetail(characterID: character.id)
                                    } label: {
                                        CharacterCardView(character: character)
                                    }

                                   
                                }
                            }
                        }
                    }.padding(12)
                    //--end cardview--
                    
                    //---ListView---
                    LazyVStack(alignment: .leading,spacing:12){
                        Text("Characters").font(.headline)
                        ForEach(viewModel.remaningCharacter) { character in
                            NavigationLink {
                                CharacterDetail(characterID: character.id)
                            } label: {
                                CharacterRowCell(character: character).onAppear{
                                    if character.id == viewModel.remaningCharacter.last?.id{
                                        viewModel.loadCharacters()
                                    }
                                }
                            }

                            
                        }
                    }.padding(.horizontal,12)
                    //---end ListView---
                    
                    if viewModel.isLoading{
                        LoadingView()
                    }

                }
                
            }.navigationTitle("Characters").toolbar(.hidden, for: .navigationBar).onAppear{
                viewModel.loadCharacters()
            }
        }.tint(Color(uiColor: .label))
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersList()
    }
}
