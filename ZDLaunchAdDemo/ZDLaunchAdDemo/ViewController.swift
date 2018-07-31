//
//  ViewController.swift
//  ZDLaunchAdDemo
//
//  Created by season on 2018/7/26.
//  Copyright © 2018年 season. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 30))
        label.numberOfLines = 0
        label.center = view.center
        label.text = "这家伙很懒,什么都没留下"
        label.textAlignment = .center
        view.addSubview(label)
    }
}
