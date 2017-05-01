//
//  YJMainTableViewCell.swift
//  PracticeSwift
//
//  Created by 杨雪剑 on 2017/4/20.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

import UIKit
import SnapKit


class YJMainTableViewCell: UITableViewCell {
    
   lazy var backImageView: UIImageView = {
        
        let backImageView = UIImageView.init()
    
        backImageView.backgroundColor = .white
    
        return backImageView
    }()
    
   lazy var titleLabel: UILabel = {
        
        let title = UILabel.init()
            title.backgroundColor = .orange
            title.textColor = .white
            title.text = "GQ Men"
    
        return title
    }()
    
   lazy var describeLabel: UILabel = {
        
        let describeLabel = UILabel.init()
            describeLabel.textColor = .white
            describeLabel.backgroundColor = .black
            describeLabel.text = "书中的描写都被这些先生篡改了"
            describeLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        return describeLabel
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .gray
        
        self.contentView.addSubview(backImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(describeLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backImageView.snp.makeConstraints { (make) in
            
            make.bottom.left.right.equalTo(0)
            make.top.equalTo(10)
        }
        
        titleLabel.snp.makeConstraints { (make) in
    
            make.bottom.equalTo(self.snp.centerY)
            make.width.greaterThanOrEqualTo(0).offset(20)
            make.height.equalTo(30)
            make.centerX.equalTo(self.snp.centerX)
            
        }
        
        describeLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(40)
            make.centerX.equalTo(self.snp.centerX)
            make.width.greaterThanOrEqualTo(0).offset(20)
            
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
