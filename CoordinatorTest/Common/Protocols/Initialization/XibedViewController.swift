//
//  Xibed.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 10/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

protocol XibedViewController: Instantiable {}

extension XibedViewController where Self: UIViewController {
    
    static func instantiate() -> Self? {
        let className = String(describing: self)
        let bundle = Bundle(for: Self.self)
        let viewController = Self(nibName: className, bundle: bundle)
        return viewController
    }
    
}
