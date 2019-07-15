//
//  BuyCoordinator.swift.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 05/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

protocol BuyCoordinatorDelegate: class {
    
    func buyDidCompleted()
    
}

class BuyCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var delegate: BuyCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let vc = BuyViewController.instantiate() {
            vc.delegate = self
            navigationController.pushViewController(vc, animated: true)
        } else {
            let coordinatorName = String(describing: self)
            logFault(category: "ViewController", message: "Coordinator %{PUBLIC}@ failed to load ViewController %{PUBLIC}@ - instantiate() failed.", coordinatorName, "BuyViewController")
        }
        
    }
    
}

extension BuyCoordinator: Loggable {}

extension BuyCoordinator: BuyViewControllerDelegate {
    
    func coordinatorDidCompleteBuy() {
        delegate?.buyDidCompleted()
    }
    
}
