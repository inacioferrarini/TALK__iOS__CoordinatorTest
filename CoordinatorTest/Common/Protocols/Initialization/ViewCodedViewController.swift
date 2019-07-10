//
//  ViewCoded.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 10/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

protocol ViewCodedViewController: Instantiable {}

extension ViewCodedViewController where Self: UIViewController {
    
    static func instantiate() -> Self? {
        return Self()
    }
    
}

