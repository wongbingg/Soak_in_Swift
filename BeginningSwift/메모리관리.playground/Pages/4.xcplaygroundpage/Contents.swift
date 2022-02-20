import UIKit

class ParentViewController: UIViewController, ChildViewControllerProtocol {
    
    let childViewController = childViewController()
    childViewController.delegate = self
}
