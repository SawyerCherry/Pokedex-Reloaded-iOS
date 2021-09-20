//
//  ContentView.swift
//  PokeDex
//
//  Created by Sawyer Cherry on 9/15/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokemonNewtwork()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.pokemon) { pokemon in
                    PokemonCellView(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
