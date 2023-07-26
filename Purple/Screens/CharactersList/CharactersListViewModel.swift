//
//  CharactersListViewModel.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import SwiftUI

class CharactersListViewModel: ObservableObject {
    @Published var firstFiveCharacter: [Character] = []
    @Published var remaningCharacter: [Character] = []
    @Published var isLoading = false
    
    var currentPage = 1
    
    func loadCharacters() {
            isLoading = true
            let service = CharacterService()
            
            service.fetchCharacters(page: currentPage) { [weak self] result in
                guard let self = self else { return }
                switch result {
                    case .success(let data):
                        DispatchQueue.main.async {
                            if !data.isEmpty{
                                if(self.currentPage == 1){
                                    self.firstFiveCharacter = Array(data.prefix(5))
                                    self.remaningCharacter = Array(data.dropFirst(5))
                                }else {
                                    self.remaningCharacter.append(contentsOf: data)
                                }
                                self.isLoading = false
                            }
                            self.currentPage += 1
                        }
                    case .failure(let error):
                        print(error)
                        self.isLoading = false
                }
            }
    }
}
