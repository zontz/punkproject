//
//  String+Localization.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/27/23.
//

import Foundation

extension String {

    /// plural
    func localized<T>(_ count: T) -> String {
        return String.localizedStringWithFormat(localized(), count as! CVarArg)
    }

    /// string
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    /// format string
    func localized(arguments: [String]) -> String {
        return String(format: localized(), arguments: arguments)
    }
}
