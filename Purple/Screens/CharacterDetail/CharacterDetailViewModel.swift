//
//  CharacterDetailViewModel.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//


import SwiftUI
import RickAndMortyAPI

class CharacterDetailViewModel:ObservableObject{
    @Published var character:CharacterDetailModel? = nil
    let characterID:RickAndMortyAPI.ID
    
    init(characterID: RickAndMortyAPI.ID) {
        self.characterID = characterID
    }
    
    func getCharacterDetail(){
        let service = CharacterService()
        
        service.fetchCharacterDetail(characterID: characterID) { result in
            switch result {
                    
                case .success(let characterData):
                    self.character = characterData
                case .failure(let error):
                    print(error)
            }
        }
    }
}


























//import SwiftUI
//import RickAndMortyAPI
//
//class CharacterDetailViewModel:ObservableObject{
//
//    let characterID:RickAndMortyAPI.ID
//
//    @Published var character:CharacterDetailModel? = nil
//    @Published var isLoading = false
//
//    init(characterID: RickAndMortyAPI.ID) {
//        self.characterID = characterID
//    }
//
//
//    func loadCharacter(){
//        isLoading = true
//        let service = CharacterService()
//
//        service.fetchCharacterDetail(characterID: characterID){ [weak self] result in
//            guard let self = self else {return}
//            switch result{
//                case .success(let data):
//                    guard let data = data else {return}
//                    print(data)
//                    character = data
//                    isLoading = false
//
//                case .failure(let error):
//                    print(error)
//            }
//        }
//    }
//}
