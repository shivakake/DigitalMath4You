//
//  LengthsViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class LengthsViewController: UIViewController {

    @IBOutlet weak var lengthsTableView: UITableView!
    
    var lengthsData : [Math4LifeDataModel] = [Math4LifeDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Lengths"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func commonMethods() {
        setNavigationButtons()
        getMathData()
        configureTableView()
    }
    
    func setNavigationButtons() {
        let backButtonImage = UIImage(systemName: "chevron.left")
        let backBarButtonItem = UIBarButtonItem(image: backButtonImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(backBarButtonTapped(_:)))
        navigationItem.leftBarButtonItems = [backBarButtonItem]
    }
    
    @objc func backBarButtonTapped(_ sender : UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getMathData() {
        lengthsData = [Math4LifeDataModel(name: "Length 2", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 3", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 4", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 5", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 6", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 7", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 8", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 9", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 10", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 11", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 12", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 13", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 14", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 15", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 16", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 17", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 18", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 19", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Length 20", time: "0", percentage: "0%")
        ]
    }
    
    func configureTableView() {
        lengthsTableView.dataSource = self
        lengthsTableView.delegate = self
        lengthsTableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "CommonTableViewCell")
    }
}

extension LengthsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lengthsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = lengthsTableView.dequeueReusableCell(withIdentifier: "CommonTableViewCell", for: indexPath) as? CommonTableViewCell {
            cell.configureCell(model: lengthsData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension LengthsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = QuestionViewController()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
