//
//  Logger.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/20/23.
//

import Foundation
import CocoaLumberjack
import CocoaLumberjackSwift

final class Logger {

    let flag: DDLogFlag
    let prefix: String

    init(flag: DDLogFlag = .debug,
         prefix: String = "") {

        self.flag = flag
        self.prefix = prefix
    }

    @inlinable
    func log(_ flag: DDLogFlag? = nil, _ message: String) {
        let flag = flag ?? self.flag
        let message = format(flag, prefix, message)
        print(flag, message)

    }

    @inlinable
    func log(_ message: String, _ error: Error?) {
        var message = format(.error, prefix, message)
        if let error = error as? LogStringConvertible {
            message += " " + error.logDescription
        } else if let errorDescription = error?.localizedDescription {
            message += " " + errorDescription
        }
        print(flag, message)

    }

    @inlinable
    func format(_ flag: DDLogFlag, _ prefix: String, _ message: String) -> String {
        return flag.emoji + (prefix.isEmpty ? "" : " \(prefix) ") + message

    }

    // MARK: - Private methods

    private func print(_ flag: DDLogFlag, _ string: String) {
        #if PROD
        return
        #endif

        switch flag {
        case .error:
            DDLogError(string)
        case .warning:
            DDLogWarn(string)
        case .info:
            DDLogInfo(string)
        case .debug:
            DDLogDebug(string)
        case .verbose:
            DDLogVerbose(string)
        default:
            debugPrint(string)
        }
    }
}

extension Logger {

    @inlinable
    static func log(_ flag: DDLogFlag = .debug, _ message: String) {
        Logger().log(flag, message)
    }

    @inlinable
    static func log(_ message: String, _ error: Error) {
        Logger().log(message, error)
    }
}
