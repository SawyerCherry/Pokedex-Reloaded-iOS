//
//  PokemonDataView.swift
//  PokeDex
//
//  Created by Sawyer Cherry on 9/15/21.
//

import SwiftUI
import Kingfisher

struct PokemonCellView: View {
    let pokemon: Pokemon
    var body: some View {
        HStack {
            Text(pokemon.name.capitalized)
                .font(.title)
                .fontWeight(.regular)
            
            Spacer()
            
            KFImage(URL(string: pokemon.imageURL))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                
        }
        
    }
}

