//
//  File.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/20/23.
//

import Foundation
import CocoaLumberjack

protocol LogCompatible {
    var logger: Logger { get }
}

extension LogCompatible {
    
    @inlinable
    func log(_ flag: DDLogFlag, _ message: String) {
        logger.log(flag, message)
    }

    @inlinable
    func log(_ message: String, _ error: Error?) {
        logger.log(message, error)
    }

    @inlinable
    func log(_ message: String) {
        log(logger.flag, message)
    }
}
