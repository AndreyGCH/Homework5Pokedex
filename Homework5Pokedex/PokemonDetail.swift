//
//  PokemonDetail.swift
//  Homework5Pokedex
//
//  Created by Andrey Guevara on 3/3/21.
//
import Foundation
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    @Published var PokemonDetailStruct = PokemonDetailStuct(height: "", weight: "", id: "")
    
    func getData(url:String){
        guard let url = URL(string:url) else {
            print("Error URL")
            return
        }
        print("get data")
        URLSession.shared.dataTask(with: url){data, _, _ in
            print(url)
            if let data = data {
                if let detail = try? JSONDecoder().decode(PokemonDetailStuct.self, from: data){
                    DispatchQueue.main.async {
                        print(detail.id + "inner function")
                        self.PokemonDetailStruct = detail
                    }
                    return
                }else{
                    print("No detail")
                }
            }else{
                print("No data")
            }
            
    }.resume()
    }
}

struct PokemonDetail: View {
    var pokemon: PokemonListEntry
    @ObservedObject var PokemonDetailVM = PokemonDetailViewModel()
    
    

    
    var body: some View {
        VStack(){
            Text(PokemonDetailVM.PokemonDetailStruct.height)
        }.onAppear(perform: {
            print("Detail \(pokemon.name) id:\(PokemonDetailVM.PokemonDetailStruct.id) ")
            self.PokemonDetailVM.getData(url:pokemon.url)
            print(self.PokemonDetailVM.PokemonDetailStruct.id)
        })
    }
    
}

//struct PokemonDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetail(pokemon: PokemonListEntry.init(name: "bulbasaur", url: "prueba"), detail: PokemonDetailStuct.init(height: "0", weight: "0", id: "0", sprites: SpritesData(frontDefault: "0")))
// }
//}
