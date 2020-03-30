//
//  WeatherListViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 28.03.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

// swiftlint:disable implicitly_unwrapped_optional

class WeatherListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: WeatherListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        presenter.viewDidLoad()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(
                nibName: String(describing: WeatherListCell.self),
                bundle: Bundle.main
            ),
            forCellReuseIdentifier: String(describing: WeatherListCell.self)
        )
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: WeatherListCell.self),
            for: indexPath
        ) as? WeatherListCell else {
            fatalError("Wrong identifier")
        }

        cell.titleLabel.text = String(Int.random(in: 0...100))

        return cell
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
