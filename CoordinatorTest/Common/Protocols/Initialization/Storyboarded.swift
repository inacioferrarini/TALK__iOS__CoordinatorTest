import UIKit

protocol Storyboarded: Instantiable {}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self? {
        let className = String(describing: self)
        let bundle = Bundle(for: Self.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: className) as? Self
    }
    
}
