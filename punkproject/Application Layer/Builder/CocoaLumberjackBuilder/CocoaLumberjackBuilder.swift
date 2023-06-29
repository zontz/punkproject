//
//  CocoaLumberjackBuilder.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/20/23.
//

import Foundation
import CocoaLumberjack
// MARK: - Initilizator 
final class CocoaLumberjackBuilder: Builder {
    func build() throws {
        DDLog.add(DDOSLogger.sharedInstance)
    }
}
