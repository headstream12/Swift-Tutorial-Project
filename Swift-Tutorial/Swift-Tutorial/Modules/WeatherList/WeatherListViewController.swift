//
//  WeatherListViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 28.03.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

// swiftlint:disable implicitly_unwrapped_optional prohibited_super_call

class WeatherListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var cellModels: [PTableViewCellAnyModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var presenter: WeatherListPresenter!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func loadView() {
        super.loadView()
        print(2)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        presenter.viewDidLoad()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(models: [WeatherListHeaderCellModel.self])
        tableView.register(WeatherListCodeCell.self, forCellReuseIdentifier: String(describing: WeatherListCodeCell.self))
    }
}

extension WeatherListViewController {
    func showData(with cellModels: [PTableViewCellAnyModel]) {
        self.cellModels = cellModels
    }
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withModel: cellModels[indexPath.row], for: indexPath)
    }
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
