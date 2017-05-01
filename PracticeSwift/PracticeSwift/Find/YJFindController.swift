//
//  YJFindController.swift
//  PracticeSwift
//
//  Created by 杨雪剑 on 2017/4/20.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

import UIKit

class YJFindController: UIViewController, BaseControllerConfig {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationBarConfig(titleImageName: "发现")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
