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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var goToListButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!

    var presenter: StartupPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        presenter.viewDidLoad()
    }

    private func setupViews() {
        DispatchQueue(label: "number1").async {
            for _ in 0...99 {
                print("go")
            }
        }
    }

    @IBAction private func didTapWeatherListButton(_ sender: UIButton) {
        presenter.didTapWeatherListButton()
    }
}

// Data Binding

extension StartupViewController {
    func bindData(with viewModel: StartupViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        goToListButton.setTitle(viewModel.firstButtonTitle, for: .normal)
        aboutButton.setTitle(viewModel.secondButtonTitle, for: .normal)
    }
}
