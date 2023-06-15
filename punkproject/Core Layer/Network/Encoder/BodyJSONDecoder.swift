//
//  BodyJSONEncoder.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/15/23.
//

import Foundation

struct BodyJSONDecoder: BodyDecoder {
    private let jsonDecoder: JSONDecoder = {
        var decoder = JSONDecoder()
        return decoder
    }()
    
    func decoder() -> JSONDecoder {
        print("decod")
        return jsonDecoder
    }
}
