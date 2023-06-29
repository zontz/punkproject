//
//  BuilderImpl.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/20/23.
//

import Foundation
// MARK: - Initilizator
// MARK: - Swinject

class BuilderImpl: Builder {

    private let builders: [Builder]

    init(_ builders: [Builder]) {
        self.builders = builders
    }

    // MARK: - Configurator

    func build() throws {
        try builders.forEach {
            try $0.build()
        }
    }
}
