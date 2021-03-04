//
//  PokemonDetail.swift
//  Homework5Pokedex
//
//  Created by Andrey Guevara on 3/3/21.
//
import Foundation
import SwiftUI

struct PokemonDetail: View {
    var pokemon: PokemonListEntry
    var body: some View {
        Text(pokemon.name)
        Text(pokemon.url)
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(pokemon: PokemonListEntry.init(name: "bulbasaur", url: "prueba"))
 }
}
