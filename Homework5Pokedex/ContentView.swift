//
//  ContentView.swift
//  Homework5Pokedex
//
//  Created by Andrey Guevara on 2/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkingManager = NetworkingManager()
    var body: some View {
        VStack(){
            NavigationView{
                List(networkingManager.pokemonList.results, id: \.url){
                    pokemon in
                    NavigationLink(
                        destination: PokemonDetail(pokemon:pokemon)){
                        Text(pokemon.name.capitalized)
                    }
                }.navigationBarTitle(Text("Pokedex"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
