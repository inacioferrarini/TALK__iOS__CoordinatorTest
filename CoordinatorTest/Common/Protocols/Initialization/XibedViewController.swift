import UIKit

protocol XibedViewController: Instantiable {}

extension XibedViewController where Self: UIViewController {
    
    static func instantiate() -> Self? {
        let className = String(describing: self)
        let bundle = Bundle(for: Self.self)
        return Self(nibName: className, bundle: bundle)
    }
    
}
