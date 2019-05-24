//
//  ViewController.swift
//  PeekAndPopLeak
//
//  Created by Raphaël PINTO on 24/05/2019.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    deinit {
        print("deinit ViewController")
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        
        return viewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerForPreviewing(with: self, sourceView: self.view!)
        
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        
        let navController = CustomNavigationController(rootViewController: viewController)
        
        UIApplication.shared.delegate?.window??.rootViewController = navController
    }
}

class CustomNavigationController : UINavigationController {
    
}

