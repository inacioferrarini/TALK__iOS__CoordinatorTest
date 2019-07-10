//
//  Instantiable.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 04/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

/// Markup protocol used to designate that the object intentionally is capable to handle properly its own instantiation.
protocol Instantiable {
    
    /// Returns an instance of the given object.
    /// Since objects can fail to instantiate, it is safer to assume they may fail.
    ///
    /// - Returns: Instantiated object
    static func instantiate() -> Self?
    
}
