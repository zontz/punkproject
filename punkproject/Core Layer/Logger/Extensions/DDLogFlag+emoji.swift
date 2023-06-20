//
//  Extensions.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/20/23.
//

import Foundation
import CocoaLumberjack

extension DDLogFlag {
    var emoji: String {
        switch self {
        case .error:
            return "🛑"

        case .warning:
            return "⚠️"

        case .info:
            return "💡"

        case .debug:
            return "⚙️"

        default:
            return ""
        }
    }
}
