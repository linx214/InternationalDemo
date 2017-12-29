//
//  CustomizeButton.swift
//  CustomizeButton
//
//  Created by linx on 2017/11/9.
//  Copyright © 2017年 haoyicn. All rights reserved.
//

import UIKit
import SnapKit

protocol CustomizeButtonDelegate: class {
    func buttonSelected(_ selected: Int)
}

class CustomizeButton: UIView {
    let buttonWidth: CGFloat = 34.0
    let buttonCornerRadius: CGFloat = 17.0
    let dotRadius: CGFloat = 6.0
    weak var delegate: CustomizeButtonDelegate?
    
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = buttonCornerRadius
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(button1Click), for: .touchDown)
        button.setImage(UIImage(named: "button1Normal"), for: .normal)
        button.setImage(UIImage(named: "button1Highlight"), for: .highlighted)

        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = buttonCornerRadius
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(button2Click), for: .touchDown)
        button.setImage(UIImage(named: "button2Normal"), for: .normal)
        button.setImage(UIImage(named: "button2Highlight"), for: .highlighted)

        return button
    }()

    lazy var button3: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = buttonCornerRadius
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(button3Click), for: .touchDown)
        button.setImage(UIImage(named: "button3Normal"), for: .normal)
        button.setImage(UIImage(named: "button3Highlight"), for: .highlighted)

        return button
    }()
    
    lazy var dotImage1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dotImage"))
        imageView.layer.cornerRadius = dotRadius / 2
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    lazy var dotImage2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dotImage"))
        imageView.layer.cornerRadius = dotRadius / 2
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    init(frame: CGRect, selected: Int) {
        super.init(frame: frame)
        
        setupUI()
        configUI(selected: selected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        self.addSubview(dotImage1)
        self.addSubview(dotImage2)
        
        button1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonWidth)
        }
        
        dotImage1.snp.makeConstraints { (make) in
            make.top.equalTo(button1.snp.bottom).offset(5)
            make.centerX.equalTo(self)
            make.width.equalTo(dotRadius)
            make.height.equalTo(dotRadius)
        }
        
        button2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(dotImage1.snp.bottom).offset(5)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonWidth)
        }
        
        dotImage2.snp.makeConstraints { (make) in
            make.top.equalTo(button2.snp.bottom).offset(5)
            make.centerX.equalTo(self)
            make.width.equalTo(dotRadius)
            make.height.equalTo(dotRadius)
        }
        
        button3.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(dotImage2.snp.bottom).offset(5)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonWidth)
        }
    }
    
    private func configUI(selected: Int) {
        if selected == 0 {
            button1.setImage(UIImage(named: "button1Highlight"), for: .normal)
        } else if selected == 1 {
            button2.setImage(UIImage(named: "button2Highlight"), for: .normal)
        } else if selected == 2 {
            button3.setImage(UIImage(named: "button3Highlight"), for: .normal)
        }
    }
    
    @objc func button1Click() {
        setSelected(index: 0)

        delegate?.buttonSelected(0)
    }
    
    @objc func button2Click() {
        setSelected(index: 1)
        
        delegate?.buttonSelected(1)
    }
    
    @objc func button3Click() {
        setSelected(index: 2)      
        
        delegate?.buttonSelected(2)
    }
    
    func setSelected(index: Int) {
        if index == 0 {
            button1.setImage(UIImage(named: "button1Highlight"), for: .normal)
            button2.setImage(UIImage(named: "button2Normal"), for: .normal)
            button3.setImage(UIImage(named: "button3Normal"), for: .normal)
        } else if index == 1 {
            button1.setImage(UIImage(named: "button1Normal"), for: .normal)
            button2.setImage(UIImage(named: "button2Highlight"), for: .normal)
            button3.setImage(UIImage(named: "button3Normal"), for: .normal)
        } else if index == 2 {
            button1.setImage(UIImage(named: "button1Normal"), for: .normal)
            button2.setImage(UIImage(named: "button2Normal"), for: .normal)
            button3.setImage(UIImage(named: "button3Highlight"), for: .normal)  
        }
    }
}
