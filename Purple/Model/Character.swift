//
//  Character.swift
//  Purple
//
//  Created by Work on 25.07.2023.
//

import Foundation
import RickAndMortyAPI

struct Character: Identifiable {
    let id: String
    let name: String
    let status: String
    let species: String
    let image: String
    
    init(characterData: CharactersQuery.Data.Characters.Result) {
        id = characterData.id ?? ""
        name = characterData.name ?? ""
        status = characterData.status ?? ""
        species = characterData.species ?? ""
        image = characterData.image ?? ""
    }
}
