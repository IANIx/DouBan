//
//  HomeTableViewCell.swift
//  douban
//
//  Created by 薛佳妮 on 2018/2/1.
//  Copyright © 2018年 jiani. All rights reserved.
//

import UIKit
import SnapKit

//MARK: - Context
class ContentView: UIView {
    
    var titleLabel : UILabel! = nil
    var contentLabel : UILabel! = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupSubviews()
    }
    
    func setupSubviews() {
        titleLabel = UILabel.init()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.black
        
        contentLabel = UILabel.init()
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = UIColor.gray
        
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.right.equalTo(self)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.right.equalTo(self)
            make.bottom.lessThanOrEqualTo(self)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//MARK: - Proflie
class ProflieView: UIView {
    
    var avatarImgV : UIImageView! = nil
    var authorLabel : UILabel! = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupSubViews()
    }
    
    func setupSubViews() {
        avatarImgV = UIImageView.init()
        avatarImgV.backgroundColor = UIColor.purple
        
        authorLabel = UILabel.init()
        authorLabel.textColor = UIColor.gray
        
        self.addSubview(avatarImgV)
        self.addSubview(authorLabel)
        
        avatarImgV.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.width.equalTo(avatarImgV.snp.height)
        }
        
        authorLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(avatarImgV.snp.right).offset(10)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - IMG
class IMGView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - From
class FromView: UIView {
    
    var lineView : UIView! = nil
    var fromlabel : UILabel! = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupSubviews()
    }
    
    func setupSubviews() {
        lineView = UIView.init()
        lineView?.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.addSubview(lineView!)
        
        fromlabel = UILabel.init()
        fromlabel?.textColor = UIColor.gray
        self.addSubview(fromlabel)
        
        lineView!.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.width.equalTo(1.5)
        }
        
        fromlabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(lineView)
            make.left.equalTo(lineView.snp.right).offset(8)
        })
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class StatusView: UIView {
    var cell : HomeTableViewCell!
    
    var fromView : FromView?
    var contextView : ContentView!
    var imgView : IMGView!
    var profileView : ProflieView!
    
    var layout : DBHomeLayout!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setupSubviews()
    }
    
    func setupSubviews() {
        
        fromView = FromView.init()
        contextView = ContentView.init()
        imgView = IMGView.init()
        imgView.backgroundColor = UIColor.green
        profileView = ProflieView.init()
        
        self.addSubview(fromView!)
        self.addSubview(contextView)
        self.addSubview(imgView)
        self.addSubview(profileView)
    }
    
    func setLayout(layout : DBHomeLayout) {
        self.layout = layout
        
        self.settingContent()
        self.settingFont()
        
        if (layout.status.from.fromId != DBFromType.DBFromTypeNomal) {
            fromView!.snp.makeConstraints { (make) in
                make.left.equalTo(layout.padding)
                make.right.equalTo(-layout.padding)
                make.top.equalTo(layout.paddingHeight)
                make.height.equalTo(layout.fromHeight)
            }
        } else {
            fromView!.removeFromSuperview()
        }
        

        contextView.snp.makeConstraints { (make) in
            if (layout.status.from.fromId != DBFromType.DBFromTypeNomal) {
                make.top.equalTo(fromView!.snp.bottom)
            } else {
                make.top.equalTo(layout.paddingHeight)
            }
            make.left.equalTo(layout.padding)
            if (layout.status.img != nil) {
                make.right.equalTo(-layout.padding! - layout.imgWidth! - layout.padding!)
            } else {
                make.right.equalTo(-layout.padding)
            }
            make.height.equalTo(layout.contextHeight)
        }
        
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(contextView.snp.right).offset(layout.padding)
            make.top.equalTo(contextView.snp.top)
            make.width.equalTo(layout.imgWidth)
            make.height.equalTo(layout.imgHeight)
        }
        
        profileView.snp.makeConstraints { (make) in
            make.left.equalTo(contextView.snp.left)
            make.top.equalTo(contextView.snp.bottom)
            make.right.equalTo(-layout.padding)
            make.height.equalTo(layout.profileHeight)
        }
        
    }
    
    func settingContent() {
        contextView.titleLabel.text = layout.status.title
        contextView.contentLabel.text = layout.status.context
        profileView.authorLabel.text = layout.status.user.userName
        
        if layout.status.from.fromId != DBFromType.DBFromTypeNomal {
            fromView!.fromlabel.text = layout.status.from.column
        }
    }
    
    func settingFont() {
        contextView.titleLabel.font = layout.titleFont
        contextView.contentLabel.font = layout.contentFont
        profileView.authorLabel.font = layout.authorFont
        
        if layout.status.from.fromId != DBFromType.DBFromTypeNomal {
            fromView!.fromlabel.font = layout.fromFont
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Cell
class HomeTableViewCell: UITableViewCell {

    var layout : DBHomeLayout?
    
    var statusView : StatusView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.setupView()
    }
    
    func setupView() {
        
        statusView = StatusView.init()
        self.contentView.backgroundColor = UIColor.groupTableViewBackground
        self.contentView.addSubview(statusView)
        statusView.cell = self
        
    }
    
    public func setLayout(layout : DBHomeLayout) {
        self.layout = layout
        
        statusView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.contentView)
            make.bottom.equalTo(self.contentView).offset(-layout.separationHeight)
        }
        statusView.setLayout(layout: layout)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
