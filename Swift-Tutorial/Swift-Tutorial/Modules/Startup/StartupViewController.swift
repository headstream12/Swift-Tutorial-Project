//
//  StartupViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 14.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

// swiftlint:disable implicitly_unwrapped_optional

class StartupViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    var presenter: StartupPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

    @IBAction private func didTapWeatherListButton(_ sender: UIButton) {
        presenter.didTapWeatherListButton()
    }
}
