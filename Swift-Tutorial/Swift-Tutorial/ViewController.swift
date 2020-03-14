//
//  ViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 14.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func isEven(number: Int) -> Bool {
        return number % 2 == 0
    }

}

