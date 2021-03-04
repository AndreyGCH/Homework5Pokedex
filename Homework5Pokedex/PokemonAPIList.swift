//
//  PokemonApiList.swift
//  Homework5Pokedex
//
//  Created by Andrey Guevara on 2/3/21.
//

import Foundation



struct PokemonAPIList: Decodable{
    var results: [PokemonListEntry]
}

struct PokemonListEntry: Codable{
    var name: String
    var url: String
}

struct PokemonDetailStuct: Decodable{
    var height: String
    var weight: String
    var id: String
    var sprites: SpritesData
}

struct SpritesData: Decodable{
    var frontDefault: String
    
    enum CodingKeys: String, CodingKey{
        case frontDefault = "front_default"
    }
}
