//
//  SprintsViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class SprintsViewController: UIViewController {

    
    @IBOutlet weak var sprintTableView: UITableView!
    
    var sprintData : [Math4LifeDataModel] = [Math4LifeDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Sprints"
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
        print("Back Bar Button Tapped")
    }
    
    func getMathData() {
        sprintData = [Math4LifeDataModel(name: "Shiva", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Shiva", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Shiva", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Shiva", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Shiva", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Shiva", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Shiva", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Shiva", time: "", percentage: "")]
    }
    
    func configureTableView() {
        sprintTableView.dataSource = self
        sprintTableView.delegate = self
        sprintTableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "CommonTableViewCell")
    }
}

extension SprintsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sprintData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = sprintTableView.dequeueReusableCell(withIdentifier: "CommonTableViewCell", for: indexPath) as? CommonTableViewCell {
            cell.configureCell(model: sprintData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension SprintsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
