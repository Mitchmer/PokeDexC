//
//  PokemonViewController.swift
//  PokeDexC
//
//  Created by Mitch Merrell on 8/20/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }

}

extension PokemonViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text?.lowercased(), !searchTerm.isEmpty else { return }
        
        MMPokemonController.fetchPokemon(withSearchTerm: searchTerm) { (pokemon) in
            guard let pokemon = pokemon else { return }
            
            DispatchQueue.main.async {
                self.nameLabel.text = pokemon.pokemonName
                self.idLabel.text = String(pokemon.identifier)
                self.abilitiesLabel.text = pokemon.abilities.joined(separator: ", ")
            }
        }
    }
}
