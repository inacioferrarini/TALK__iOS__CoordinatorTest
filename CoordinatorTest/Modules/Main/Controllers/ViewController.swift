//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 04/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {

    func handleBuySubscription()
    func handleCreateAccount()

}

class ViewController: UIViewController, Storyboarded {
    
    weak var delegate: ViewControllerDelegate?

    @IBAction func buyTapped(_ sender: Any) {
        delegate?.handleBuySubscription()
    }
    
    @IBAction func createAccount(_ sender: Any) {
        delegate?.handleCreateAccount()
    }
    
}
