//
//  ViewController.swift
//  PeekAndPopLeak
//
//  Created by Raphaël PINTO on 24/05/2019.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    var context : UIViewControllerPreviewing?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unregisterForPreviewing(withContext: self.context!)
    }
    
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
        
        self.context = registerForPreviewing(with: self, sourceView: self.view!)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        unregisterForPreviewing(withContext: self.context!)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        
        let navController = CustomNavigationController(rootViewController: viewController)
        
        UIApplication.shared.delegate?.window??.rootViewController = navController
    }
}

class CustomNavigationController : UINavigationController {
    
}

