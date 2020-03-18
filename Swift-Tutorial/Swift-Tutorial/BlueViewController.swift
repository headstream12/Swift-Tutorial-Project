//
//  ViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 14.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    @IBOutlet weak var childView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("frame \(childView.frame)")
        print("privet")
    }
}
