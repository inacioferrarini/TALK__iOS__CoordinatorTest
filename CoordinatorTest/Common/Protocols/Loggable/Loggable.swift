//
//  Loggable.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 15/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import Foundation
import os.log

protocol Loggable: class {
    
    func logDefault(module: String?, category: String, message: StaticString, _ args: CVarArg...)
    func logInfo(module: String?, category: String, message: StaticString, _ args: CVarArg...)
    func logDebug(module: String?, category: String, message: StaticString, _ args: CVarArg...)
    func logError(module: String?, category: String, message: StaticString, _ args: CVarArg...)
    func logFault(module: String?, category: String, message: StaticString, _ args: CVarArg...)

}

extension Loggable {
    
    func logDefault(module: String? = nil, category: String, message: StaticString, _ args: CVarArg...) {
        let subsystem = module ?? bundleName
        let logger = OSLog(subsystem: subsystem, category: category)
        log(logger: logger, message: message, type: .default, args)
    }
    
    func logInfo(module: String? = nil, category: String, message: StaticString, _ args: CVarArg...) {
        let subsystem = module ?? bundleName
        let logger = OSLog(subsystem: subsystem, category: category)
        log(logger: logger, message: message, type: .info, args)
    }

    func logDebug(module: String? = nil, category: String, message: StaticString, _ args: CVarArg...) {
        let subsystem = module ?? bundleName
        let logger = OSLog(subsystem: subsystem, category: category)
        log(logger: logger, message: message, type: .debug, args)
    }

    func logError(module: String? = nil, category: String, message: StaticString, _ args: CVarArg...) {
        let subsystem = module ?? bundleName
        let logger = OSLog(subsystem: subsystem, category: category)
        log(logger: logger, message: message, type: .error, args)
    }

    func logFault(module: String? = nil, category: String, message: StaticString, _ args: CVarArg...) {
        let subsystem = module ?? bundleName
        let logger = OSLog(subsystem: subsystem, category: category)
        log(logger: logger, message: message, type: .error, args)
    }

    internal var bundleName: String {
        get {
            return Bundle(for: Self.self).bundleIdentifier ?? "Unkown"
        }
    }
    
    internal func log(logger: OSLog, message: StaticString, type: OSLogType, _ args: CVarArg...) {
        os_log(message, log: logger, type: type, args)
    }
    
}
