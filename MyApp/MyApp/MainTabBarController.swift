//
//  MainTabBarController.swift
//  MyApp
//
//  Created by syc on 2018/7/7.
//  Copyright © 2018年 syc. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    private lazy var publishBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("publish", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.addTarget(self, action: #selector(self.publishAction(sender:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addPublishBtn()
    }
    // MARK: custom
    
    private func addViewController(){
        let home = HomeViewController()
        home.tabBarItem.image = UIImage()
        home.tabBarItem.selectedImage = UIImage()
        home.title = "home"
        let homeNav = UINavigationController(rootViewController: home)
        self.addChildViewController(homeNav)
        
        let category = CategoryViewController()
        category.title = "category"
        let categoryNav = UINavigationController(rootViewController: category)
        self.addChildViewController(categoryNav)
        
        let message = MessageViewController()
        message.title = "message"
        let messageNav = UINavigationController(rootViewController: message)
        self.addChildViewController(messageNav)
        
        let me = MeViewController()
        me.title = "me"
        let meNav = UINavigationController(rootViewController: me)
        self.addChildViewController(meNav)
        
        
    }
    public func addPublishBtn(){
        self.tabBar.addSubview(publishBtn)
        
        let width = UIScreen.main.bounds.size.width / CGFloat(viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: width, height: 50)
        publishBtn.frame = rect.offsetBy(dx: 1.5*width, dy: 0)
    }
    @objc func publishAction(sender: Any?){
        let v = PublishViewController()
        let nav = UINavigationController(rootViewController: v)
        
        present(nav, animated: true) {
            
        }
    }

}
