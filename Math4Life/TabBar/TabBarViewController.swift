//
//  TabBarViewController.swift
//  Math4Life
//
//  Created by PGK Shiva Kumar on 09/12/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let mathVC = MathViewController()
        let navMath = UINavigationController(rootViewController: mathVC)
        let mathIcon = UITabBarItem(title: "Math", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder"))
        navMath.tabBarItem = mathIcon
        
        let goalsVC = GoalsViewController()
        let navGoals = UINavigationController(rootViewController: goalsVC)
        let goalsIcon = UITabBarItem(title: "Goals", image: UIImage(systemName: "pencil.circle"), selectedImage: UIImage(systemName: "pencil.circle.fill"))
        navGoals.tabBarItem = goalsIcon
        
        let sprintsVC = SprintsViewController()
        let navSprints = UINavigationController(rootViewController: sprintsVC)
        let sprintsIcon = UITabBarItem(title: "Sprints", image: UIImage(systemName: "trash.circle"), selectedImage: UIImage(systemName: "trash.circle.fill"))
        navSprints.tabBarItem = sprintsIcon
        
        let leaderBoardVC = LeaderBoardViewController()
        let navLeaderBoard = UINavigationController(rootViewController: leaderBoardVC)
        let leaderBoardIcon = UITabBarItem(title: "LeaderBoard", image: UIImage(systemName: "trash.circle"), selectedImage: UIImage(systemName: "trash.circle.fill"))
        navLeaderBoard.tabBarItem = leaderBoardIcon
        
        let controllers = [navMath ,navGoals, navSprints, navLeaderBoard]
        self.viewControllers = controllers
    }
}
