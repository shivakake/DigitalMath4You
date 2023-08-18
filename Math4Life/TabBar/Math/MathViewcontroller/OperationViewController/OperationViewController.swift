//
//  OperationViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class OperationViewController: UIViewController {

    @IBOutlet weak var operationsTableView: UITableView!
    
    var operationData : [Math4LifeDataModel] = [Math4LifeDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Operations"
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.hidesBottomBarWhenPushed = true
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
        operationData = [Math4LifeDataModel(name: "Addition", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Subtraction", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Multiplication", time: "", percentage: "")]
    }
    
    func configureTableView() {
        operationsTableView.dataSource = self
        operationsTableView.delegate = self
        operationsTableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "CommonTableViewCell")
    }
}

extension OperationViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = operationsTableView.dequeueReusableCell(withIdentifier: "CommonTableViewCell", for: indexPath) as? CommonTableViewCell {
            cell.configureCell(model: operationData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension OperationViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = LevelsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
