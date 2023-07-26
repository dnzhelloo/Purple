//
//  CharacterDetail.swift
//  Purple
//
//  Created by Work on 26.07.2023.
//

import Foundation
import RickAndMortyAPI

struct CharacterDetailModel:Identifiable {
    let id: String
    let name: String
    let status: String
    let species: String
    let type: String? // Bu alan sorgudan dönen "type" alanına karşılık gelir
    let gender: String? // Bu alan sorgudan dönen "gender" alanına karşılık gelir
    let image: String
    let episode: [Episode] // Bu alan sorgudan dönen "episode" alanına karşılık gelir
    let created: String
    
    init(characterData: CharacterDetailQuery.Data.Character) {
        id = characterData.id ?? ""
        name = characterData.name ?? ""
        status = characterData.status ?? ""
        species = characterData.species ?? ""
        type = characterData.type
        gender = characterData.gender
        image = characterData.image ?? ""
        episode = characterData.episode.map { Episode(episodeData: $0!) }
        created = characterData.created ?? ""
    }
}

struct Episode:Identifiable {
    let airDate: String
    let created: String
    let episode: String
    let id: String
    let name: String
    
    init(episodeData: CharacterDetailQuery.Data.Character.Episode) {
        airDate = episodeData.air_date ?? ""
        created = episodeData.created ?? ""
        episode = episodeData.episode ?? ""
        id = episodeData.id ?? ""
        name = episodeData.name ?? ""
    }
}
