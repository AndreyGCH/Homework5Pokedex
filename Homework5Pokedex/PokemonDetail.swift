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
    @State var detail = PokemonDetailStuct(height: "", weight: "", id: "", sprites: SpritesData(frontDefault: ""))
    
    
    func getData(){
        
        guard let url = URL(string: pokemon.url) else {
            print("Error URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){data, _, _ in
            if let data = data {
                if let response = try? JSONDecoder().decode(PokemonDetailStuct.self, from: data){
                    DispatchQueue.main.async {
                        self.detail = response
                    }
                    return
                }
            }
            //DispatchQueue.main.async {
                //if let data = data{
                //    do{
                //        let decoder = JSONDecoder()
                //        let decodedData = try decoder.decode(PokemonDetailStuct.self, from: data)
                //        self.detail = decodedData
                //    }catch{
                //        print("Error!!")
                //    }
            //    }
            
    }.resume()
       // print("Get Detail")
    }
    
    var body: some View {
        //onAppear(){
        //    self.getData()
        //}
        VStack(){
            Text("Image: ")
            Text(pokemon.name.capitalized)
            Text(pokemon.url)
            Text("Altura: \(detail.height)")
            Text("Peso: \(detail.weight)")
            Text("ID: \(detail.id)")
            Button(
                action: {self.getData()},
                label:{
                    Text("Get Detail")
                }
            )
        }.onAppear(perform: {
            getData()
        })
    }
    
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(pokemon: PokemonListEntry.init(name: "bulbasaur", url: "prueba"), detail: PokemonDetailStuct.init(height: "0", weight: "0", id: "0", sprites: SpritesData(frontDefault: "0")))
 }
}
