//
//  YJMainController.swift
//  PracticeSwift
//
//  Created by 杨雪剑 on 2017/4/20.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

import UIKit
import Alamofire

class YJMainController: UIViewController,BaseControllerConfig,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView {
        
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(YJMainTableViewCell.classForCoder(), forCellReuseIdentifier: "cell_pool")
        tableView.rowHeight = 375.5
        
        return tableView
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationBarConfig(titleImageName: "gq_home_logo")
    
        self.view.addSubview(tableView)
    
        self.handleData()
    
    }

  override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: 网络请求数据

extension YJMainController {
    
    
    func handleData(_ page:Int = 1) {
        
        Alamofire.request("http://application.gq.com.cn/mobileadmin/gq24/api40/getindexdata?activityid=0&articleid=0").responseJSON { (responseObject) in
        
                print(responseObject.data ?? "无字节")
            
        }
        
    }
    
    
}

extension YJMainController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_pool")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    
}








