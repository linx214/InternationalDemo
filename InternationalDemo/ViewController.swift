//
//  ViewController.swift
//  InternationalDemo
//
//  Created by linx on 2017/12/28.
//  Copyright © 2017年 linx. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let customizeButton = CustomizeButton(frame: CGRect.zero, selected: 0)
    let targetButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
        configUI()
    }
    
    private func setupUI() {
        self.view.addSubview(customizeButton)
        customizeButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(50)
            make.right.equalTo(self.view).offset(-50)
            make.width.equalTo(34)
            make.height.equalTo(120)
        }
        
        self.view.addSubview(targetButton)
        targetButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(44)
            make.center.equalTo(self.view)
        }
    }
    
    private func configUI() {
        customizeButton.delegate = self
        UserDefaults.standard.set("zh-Hans", forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        guard let bundle = self.bundle() else {
            return
        }
        targetButton.setTitle(bundle.localizedString(forKey: "buttonTitle", value: nil, table: "Localizable"), for: .normal)
        targetButton.setTitleColor(.red, for: .normal)
        targetButton.backgroundColor = .black
    }
}

extension ViewController: CustomizeButtonDelegate {
    func buttonSelected(_ selected: Int) {
        switch selected {
        case 0:
            UserDefaults.standard.set("zh-Hans", forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
            guard let bundle = self.bundle() else {
                return
            }
            targetButton.setTitle(bundle.localizedString(forKey: "buttonTitle", value: nil, table: "Localizable"), for: .normal)
        case 1:
            UserDefaults.standard.set("en", forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
            guard let bundle = self.bundle() else {
                return
            }
            targetButton.setTitle(bundle.localizedString(forKey: "buttonTitle", value: nil, table: "Localizable"), for: .normal)
        case 2:
            UserDefaults.standard.set("fr", forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
            guard let bundle = self.bundle() else { 
                return
            }
            targetButton.setTitle(bundle.localizedString(forKey: "buttonTitle", value: nil, table: "Localizable"), for: .normal)
        default:
            break
        }
    }
    
    func bundle() -> Bundle? {
        if let lang = UserDefaults.standard.value(forKey: "AppleLanguages") as? String {
            if let path = Bundle.main.path(forResource: lang, ofType: "lproj") {
                return Bundle(path: path)
            }
        }

        return nil
    }
}

