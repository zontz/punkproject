//
//  ViewController.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import UIKit

class ViewController: UIViewController {
    let datS: [Beer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        getData()

    }
    func getData()  {
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.punkapi.com/v2/beers")!)) { data, response, error in
            guard let data = data else {
                return
            }
            var result: [Beer]
            do {
                result = try JSONDecoder().decode([Beer].self, from: data)

            } catch {
                print("Дарова заебал")
            }
        }
        .resume()
    }

}





















