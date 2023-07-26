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
        ZStack{
            ScrollView(){
                LazyVStack(spacing: 10) { // Veya LazyHStack kullanın
                    ForEach(viewModel.characters, id: \.id) { character in
                        HStack{
                            CharactersImage(urlString: character.image)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(12)
                                .frame(width: 120,height: 50)
                            Text(character.name)
                        }.onAppear{
                            if character.id == viewModel.characters.last?.id{
                                viewModel.loadCharacters()
                            }
                        }
                        
                        
                    }
                }
            }
            
            //Loading
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .onAppear{
            viewModel.loadCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersList()
    }
}
