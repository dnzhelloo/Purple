//
//  tetetete.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import Foundation

//ZStack{
//    ScrollView(){
//        LazyVStack(spacing: 10) { // Veya LazyHStack kullanın
//            ForEach(viewModel.characters, id: \.id) { character in
//                NavigationLink(destination: CharacterDetail(characterID: character.id)) {
//                    HStack{
//                        CharactersImage(urlString: character.image)
//                            .aspectRatio(contentMode: .fit)
//                            .cornerRadius(12)
//                            .frame(width: 120,height: 50)
//                        
//                        Text(character.name)
//                        
//                        Spacer(minLength: 120)
//                    }.onAppear{
//                        if character.id == viewModel.characters.last?.id{
//                            viewModel.loadCharacters()
//                        }
//                    }
//                }
//                
//                
//                
//            }
//        }
//    }
//    
//    //Loading
//    if viewModel.isLoading{
//        LoadingView()
//    }
//}
//.onAppear{
//    viewModel.loadCharacters()
//    }
