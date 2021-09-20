//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Sawyer Cherry on 9/15/21.
//

import Foundation


struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String

}
