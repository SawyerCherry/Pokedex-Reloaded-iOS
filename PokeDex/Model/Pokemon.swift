//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Sawyer Cherry on 9/15/21.
//

import Foundation


struct Pokemon: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "imageUrl"
        case id
    }
    var id = Int.random(in: 0...100)
    let name: String
    let imageURL: String

}
