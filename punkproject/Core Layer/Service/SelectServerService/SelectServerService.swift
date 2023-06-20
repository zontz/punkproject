//
//  SelectService.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/16/23.
//

import Foundation

protocol SelectServerService {
    func getServerHost() -> String
}

struct SelectServerServiceImpl: SelectServerService {
    func getServerHost() -> String {
        #if DEV || QA
        return HostDomains.dev.rawValue
        #elseif PROD
        return HostDomains.prod.rawValue
        #else
        return ""
        #endif
    }
}

enum HostDomains: String, CaseIterable {
    case prod = "test"
    case dev = "api.punkapi.com"
}
