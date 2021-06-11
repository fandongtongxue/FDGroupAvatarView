//
//  ViewController.swift
//  FDGroupAvatarView
//
//  Created by fandongtongxue on 06/11/2021.
//  Copyright (c) 2021 fandongtongxue. All rights reserved.
//

import UIKit
import FDGroupAvatarView

class ViewController: UIViewController {
    
    var groupAvatarView = FDGroupAvatarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        groupAvatarView = FDGroupAvatarView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        let url1 = URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/df/79/a1/df79a130-384e-43ec-03ed-614453c648ba/source/512x512bb.jpg")
        let url2 = URL(string:"https://is5-ssl.mzstatic.com/image/thumb/Purple125/v4/92/ca/78/92ca7896-75e2-52c2-e7a1-1e793816fe75/source/512x512bb.jpg")
        groupAvatarView.imgUrls = [url1!]
        view.addSubview(groupAvatarView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

