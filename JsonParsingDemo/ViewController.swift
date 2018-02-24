//
//  ViewController.swift
//  JsonParsingDemo
//
//  Created by Im100ruv on 24/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name : String
    let capital : String
    let region : String
}

class ViewController: UIViewController {
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURL = "https://restcountries.eu/rest/v2/all"
        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for eachCountry in self.countries {
                    print(eachCountry.name + " : " + eachCountry.capital + " - " + eachCountry.region)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

}

