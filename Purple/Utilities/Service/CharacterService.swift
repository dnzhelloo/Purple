//
//  CharacterService.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import Foundation
import RickAndMortyAPI

class CharacterService {
    
    func fetchCharacters(page: Int, completion: @escaping (Result<[Character], Error>) -> Void) {
        NetworkManager.shared.executeQuery(query: CharactersQuery(page: GraphQLNullable<Int>(integerLiteral: page))) { result in
            switch result {
                case .success(let data):
                    if let characterResults = data?.characters?.results {
                        // API'den gelen karakter sonuçlarını map fonksiyonuyla Character modele dönüştürüyoruz.
                        let characters = characterResults.compactMap { characterData -> Character? in
                            if let characterData = characterData {
                                return Character(characterData: characterData)
                            } else {
                                return nil
                            }
                        }
                        completion(.success(characters))
                    } else {
                        // API'den hiç karakter sonucu gelmediğinde veya boş olduğunda .failure durumunu döndürüyoruz.
                        completion(.failure(NetworkError.noData))
                    }
                case .failure(let error):
                    // API isteği başarısız olduğunda .failure durumunu döndürüyoruz.
                    completion(.failure(error))
            }
        }
    }
    
    func fetchCharacterDetail(characterID: RickAndMortyAPI.ID, completion: @escaping (Result<CharacterDetailModel?, Error>) -> Void) {
        NetworkManager.shared.executeQuery(query: CharacterDetailQuery(characterId: characterID)) { result in
            switch result {
                case .success(let data):
                    if let characterData = data?.character {
                        let characterDetailModel = CharacterDetailModel(characterData: characterData)
                        completion(.success(characterDetailModel))
                    } else {
                        completion(.failure(NetworkError.noData))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }

}



