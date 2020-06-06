//
//  FuelSelectViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class FuelSelectViewController: UIViewController {

    var presenter: FuelSelectPresenter!

    var cellModels: [PTableViewCellAnyModel] = [] {
        didSet {
            let transition = CATransition()
            transition.type = CATransitionType.push
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.fillMode = CAMediaTimingFillMode.forwards
            transition.duration = 0.5
            transition.subtype = CATransitionSubtype.fromTop
            self.tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
            self.tableView.reloadData()
        }
    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "Выбор колонки:"
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100000)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view

        view.addSubviews(
            titleLabel,
            tableView
        )
        view.backgroundColor = .white
        tableView.register(models: [FuelNumberCellModel.self])
        tableView.register(nibModels: [PaymentCellModel.self])
        presenter.viewDidLoad()

        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.right.bottom.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
    }
}

extension FuelSelectViewController {
    func showData(with cellModels: [PTableViewCellAnyModel], title: String) {
        self.cellModels = cellModels
        titleLabel.text = title
    }

    func showAlert(with title: String, completion: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default, handler: completion)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension FuelSelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let paymentCell = cell as? PaymentCell {
            paymentCell.delegate = self
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withModel: cellModels[indexPath.row], for: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRow()
    }
}

extension FuelSelectViewController: PaymentCellDelegate {
    func didTapPayButton() {
        presenter.didTapPayButton()
    }
}
