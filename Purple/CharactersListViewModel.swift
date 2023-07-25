//
//  CharactersListViewModel.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import SwiftUI

class CharactersListViewModel:ObservableObject{
    
    @Published var character:[Character] = []
    @Published var isLoading = false
    
    func loadCharacters(){
        isLoading = true
        let service = CharacterService()
       
        service.fetchCharacters(page: 1) { [weak self] result in
            guard let self = self else {return}
            switch result{
                case .success(let data):
                    character.append(contentsOf: data)
                    isLoading = false
                case .failure(let error):
                    print(error)
            }
        }
    }
    //
}
