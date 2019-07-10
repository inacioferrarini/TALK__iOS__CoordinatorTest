//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 04/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func childDidFinish(_ child: Coordinator?)
    
}

extension Coordinator {
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

}
