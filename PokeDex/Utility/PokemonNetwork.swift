//
//  Decoder.swift
//  PokeDex
//
//  Created by Sawyer Cherry on 9/15/21.
//

import SwiftUI


class PokemonNewtwork: ObservableObject {
   @Published var pokemon = [Pokemon]()
    
    var baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        findPokemon()
    }
    
    func findPokemon() {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {return}
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
}


extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
        return data
    }
}
