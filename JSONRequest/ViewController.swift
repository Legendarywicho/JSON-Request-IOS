//
//  ViewController.swift
//  JSONRequest
//
//  Created by Luis Santiago  on 1/3/18.
//  Copyright © 2018 Luis Santiago . All rights reserved.
//

import UIKit


struct Pokemon : Decodable {
    var id : Int
    var name : String
    var weight : Int
    var base_experience : Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let urlString = "https://pokeapi.co/api/v2/pokemon/1/"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            //Handle error
            //Handle response
            print("Do stuff here")
            guard let data = data else { return }
            
            //let stringAnswer = String(data: data, encoding: .utf8)
            let pokemon = try! JSONDecoder().decode(Pokemon.self, from: data)
                print(pokemon.name)
            
        }.resume()
    }
}

