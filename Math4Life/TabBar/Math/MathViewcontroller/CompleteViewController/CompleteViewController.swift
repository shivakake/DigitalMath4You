//
//  CompleteViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 10/12/22.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var numberOfQuestionsLabel: UILabel!
    @IBOutlet weak var numberOfCorrectAnsweredLabel: UILabel!
    @IBOutlet weak var numberOfWrongAnsweredLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    func commonMethods() {
        setupUI()
        assignDataToLabels()
    }
    
    func setupUI() {
        retryButton.layer.cornerRadius = retryButton.frame.size.height / 2
        completeButton.layer.cornerRadius = completeButton.frame.size.height / 2
    }
    
    func assignDataToLabels() {
        numberOfQuestionsLabel.text = "Number of questions = \(2)"
        numberOfCorrectAnsweredLabel.text = "Number of questions answered correct = \(2)"
        numberOfQuestionsLabel.text = "Number of questions answered wrong = \(2)"
    }
    
    @IBAction func retryButtonTapped(_ sender: UIButton) {
        let controller = QuestionViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        let controller = LevelsViewController()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
