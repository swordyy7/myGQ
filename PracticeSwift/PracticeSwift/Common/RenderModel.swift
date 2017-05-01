//
//  RenderModel.swift
//  PracticeSwift
//
//  Created by 杨雪剑 on 2017/4/20.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
 open class func construct(_ name: String, _ renderMode: UIImageRenderingMode) -> UIImage? {
        
        let image = UIImage.init(named: name)
        
        return image?.withRenderingMode(renderMode)
    }
    
}
