import UIKit

protocol ViewCodedViewController: Instantiable {}

extension ViewCodedViewController where Self: UIViewController {
    
    static func instantiate() -> Self? {
        return Self()
    }
    
}

