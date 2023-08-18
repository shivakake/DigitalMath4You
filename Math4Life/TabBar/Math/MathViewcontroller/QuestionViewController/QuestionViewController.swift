//
//  QuestionViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionsCountLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    var number1: Int?
    var number2: Int?
    var questionsCount : Int = 2
    var remainingQuestions : Int = 1
    var timer = Timer()
    var timeCounter: Int = 0
    var timeForOneQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func commonMethods() {
        timerLabel.text = "0"
        setNavigationButtons()
        showQuestion()
        showQuestionsCount()
        showTimer()
    }
    
    func setNavigationButtons() {
        let backButtonImage = UIImage(systemName: "chevron.left")
        let backBarButtonItem = UIBarButtonItem(image: backButtonImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(backBarButtonTapped(_:)))
        navigationItem.leftBarButtonItems = [backBarButtonItem]
    }
    
    @objc func backBarButtonTapped(_ sender : UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showQuestion() {
        //        number1 = Int.random(in: 0...9)
        number1 = FunctionsHelper.sharedInstance.getRandomNumber(incomingInt: 9)//getRandomNumber(incomingInt: 9)
        number2 = FunctionsHelper.sharedInstance.getRandomNumber(incomingInt: 9)//getRandomNumber(incomingInt: 9)
        
        if let a = number1, let b = number2 {
            questionLabel.text = "\(String(describing: a))  +  \(String(describing: b))"
        }
    }
    
    func showQuestionsCount() {
        questionsCountLabel.text = "\(remainingQuestions) out of \(questionsCount)"
    }
    
    func showTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if remainingQuestions >= questionsCount {
            if remainingQuestions == questionsCount {
                if let time = timerLabel.text {
                    let intTime = Int("\(String(describing: time))") ?? 0
                    timeForOneQuestion =  intTime + timeForOneQuestion
                    print("Total time for all questions:" , timeForOneQuestion)
                }
            }
            timer.invalidate()
            timerLabel.text = "0"
            let controller = CompleteViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }else{
            timer.invalidate()
            if let time = timerLabel.text {
                timeForOneQuestion = Int("\(String(describing: time))") ?? 0 + timeForOneQuestion
            }
            timerLabel.text = "0"
            answerTextField.text = ""
            timeCounter = 0
            remainingQuestions += 1
            showQuestionsCount()
            showTimer()
            showQuestion()
        }
    }
    
    @objc func processTimer() {
        timeCounter += 1
        let time = timeCounter
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        let formattedString = formatter.string(from: TimeInterval(time))
        timerLabel.text = formattedString
    }
}
