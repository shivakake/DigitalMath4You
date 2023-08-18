//
//  LevelsViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class LevelsViewController: UIViewController {

    @IBOutlet weak var levelsTableView: UITableView!
    
    var levelsData : [Math4LifeDataModel] = [Math4LifeDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Levels"
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
        levelsData = [Math4LifeDataModel(name: "Level 1", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Level 2", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Level 3", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Level 4", time: "0", percentage: "0%"),
                    Math4LifeDataModel(name: "Level 5", time: "0", percentage: "0%")]
    }
    
    func configureTableView() {
        levelsTableView.dataSource = self
        levelsTableView.delegate = self
        levelsTableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "CommonTableViewCell")
    }
}

extension LevelsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = levelsTableView.dequeueReusableCell(withIdentifier: "CommonTableViewCell", for: indexPath) as? CommonTableViewCell {
            cell.configureCell(model: levelsData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension LevelsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LengthsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
