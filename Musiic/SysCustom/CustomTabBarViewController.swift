//
//  CustomTabBarViewController.swift
//  Musiic
//
//  Created by 张小强 on 2019/9/11.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.barTintColor = UIColor(red: 30/255.0, green: 32/255.0, blue: 34/255.0, alpha: 1)
        self.tabBar.isTranslucent = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
