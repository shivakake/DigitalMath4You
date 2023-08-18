//
//  SplashViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    func startTimer() {
        indicatorView.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(navigateToNext), userInfo: nil, repeats: true)
    }
    
    @objc func navigateToNext() {
        let controller = TabBarViewController()
        timer.invalidate()
        indicatorView.stopAnimating()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
