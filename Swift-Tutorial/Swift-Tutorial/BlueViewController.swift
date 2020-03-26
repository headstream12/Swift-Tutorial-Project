//
//  ViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 14.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        print(backgroundImageView.frame)
    }
}
