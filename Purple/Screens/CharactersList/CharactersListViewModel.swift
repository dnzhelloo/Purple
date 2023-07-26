//
//  CharactersListViewModel.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import SwiftUI

class CharactersListViewModel:ObservableObject{
    
    @Published var characters:[Character] = []
    @Published var isLoading = false
    var currentPage = 1
    
    func loadCharacters(){
        isLoading = true
        let service = CharacterService()
       
        service.fetchCharacters(page: currentPage) { [weak self] result in
            guard let self = self else {return}
            switch result{
                case .success(let data):
                    if !data.isEmpty {
                        characters.append(contentsOf: data)
                        currentPage += 1
                        isLoading = false
                    } else {
                        // API'den gelen veri yoksa sayfalama işlemi tamamlandı demektir.
                        isLoading = false
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
