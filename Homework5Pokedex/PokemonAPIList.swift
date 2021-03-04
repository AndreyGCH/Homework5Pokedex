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

struct PokemonListEntry: Decodable{
    var name: String
    var url: String
}
