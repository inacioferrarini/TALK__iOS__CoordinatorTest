//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 04/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let vc = ViewController.instantiate() {
            vc.delegate = self
            navigationController.pushViewController(vc, animated: false)
        } else {
            let coordinatorName = String(describing: self)
            logFault(category: "ViewController", message: "Coordinator %{PUBLIC}@ failed to load ViewController %{PUBLIC}@ - instantiate() failed.", coordinatorName, "ViewController")
        }
        
    }
    
}

extension MainCoordinator: Loggable {}

extension MainCoordinator: ViewControllerDelegate {
    
    func handleBuySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        child.delegate = self
        childCoordinators.append(child)
        child.start()
    }
    
    func handleCreateAccount() {
        if let vc = CreateAccountViewController.instantiate() {
            navigationController.pushViewController(vc, animated: true)
        } else {
            let coordinatorName = String(describing: self)
            logFault(category: "ViewController", message: "Coordinator %{PUBLIC}@ failed to load ViewController %{PUBLIC}@ - instantiate() failed.", coordinatorName, "CreateAccountViewController")
        }
        
    }
    
}

extension MainCoordinator: BuyCoordinatorDelegate {
    
    func buyDidCompleted() {
        print("--> childCoordinators \(self.childCoordinators)")
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator is BuyCoordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
        print("MainCoordinator: buyDidCompleted()")
        print("--> childCoordinators \(self.childCoordinators)")
    }
    
}
