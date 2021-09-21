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
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }

            
            do {
                let pokemon = try JSONDecoder().decode([Pokemon].self, from: data)
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                }
            } catch {
                print(error.localizedDescription)
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
