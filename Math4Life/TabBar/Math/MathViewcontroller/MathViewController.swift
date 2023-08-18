//
//  MathViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class MathViewController: UIViewController {
    
    @IBOutlet weak var mathTableView: UITableView!
    
    var mathData : [Math4LifeDataModel] = [Math4LifeDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonMethods()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Math"
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
        mathData = [Math4LifeDataModel(name: "Elementary", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Foundation", time: "", percentage: ""),
                    Math4LifeDataModel(name: "Advanced", time: "", percentage: "")]
    }
    
    func configureTableView() {
        mathTableView.dataSource = self
        mathTableView.delegate = self
        mathTableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "CommonTableViewCell")
    }
}

extension MathViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mathData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mathTableView.dequeueReusableCell(withIdentifier: "CommonTableViewCell", for: indexPath) as? CommonTableViewCell {
            cell.configureCell(model: mathData[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension MathViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = OperationViewController()
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
