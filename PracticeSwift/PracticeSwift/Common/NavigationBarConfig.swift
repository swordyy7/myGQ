//
//  NavigationBarConfig.swift
//  PracticeSwift
//
//  Created by 杨雪剑 on 2017/4/20.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

import Foundation
import UIKit
protocol BaseControllerConfig {
    
    
    
    
}


extension BaseControllerConfig where Self: UIViewController {
    
    func navigationBarConfig(titleImageName: String?) {
        
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = .white
        self.view.backgroundColor = .white
        
        guard titleImageName != nil else {
            
            return
        }
        
        let customView = UIImageView.init(image: UIImage.init(named: titleImageName!))
        guard customView.image != nil else {
            
            self.navigationItem.title = titleImageName
            
            return
        }
        
        self.navigationItem.titleView = customView

    }
    
}



