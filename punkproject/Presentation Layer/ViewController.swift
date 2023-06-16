//
//  ViewController.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    private var beers: [Beer] = []
    private var cancellables = Set<AnyCancellable>()
    private let beerService = BeerServiceImpl(networkManager: NetworkManagerImpl())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        getData()
    }
}

private extension ViewController {
    func getData()  {
        beerService.getAllBeers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { beers in
                self.beers = beers
            }.store(in: &cancellables)
    }
}
