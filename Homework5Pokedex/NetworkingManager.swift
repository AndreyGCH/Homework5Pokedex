//
//  NetworkingManager.swift
//  Homework5Pokedex
//
//  Created by Andrey Guevara on 2/3/21.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager: ObservableObject{
    var didChange = PassthroughSubject<NetworkingManager, Never>()
    
    var pokemonList = PokemonAPIList(results:[]){
        didSet{
            didChange.send(self)
        }
    }
    init(){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {return}
        URLSession.shared.dataTask(with: url){(data,_,_) in
            guard let data = data else {return}
            
            let pokemonList = try! JSONDecoder().decode(PokemonAPIList.self, from: data)
            
            DispatchQueue.main.async {
                self.pokemonList = pokemonList
            }
        }.resume()
    }
}
