//
//  BuyViewController.swift
//  CoordinatorTest
//
//  Created by Inácio Ferrarini on 04/07/19.
//  Copyright © 2019 inacio. All rights reserved.
//

import UIKit

protocol BuyViewControllerDelegate: class {
    
    func coordinatorDidCompleteBuy()
    
}

class BuyViewController: UIViewController, Storyboarded {

    weak var delegate: BuyViewControllerDelegate?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.coordinatorDidCompleteBuy()
    }
    
}
