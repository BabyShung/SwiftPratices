//
//  ViewController.swift
//  SwiftPratices
//
//  Created by Hao Zheng on 1/15/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bs = BinarySearch()
        print(bs.binarySearch(nil, target: 9))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

