//
//  ViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 14.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class CovidStatsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cellModels: [PTableViewCellAnyModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var presenter: CovidStatsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(models: [ImageCellModel.self, DateCellModel.self, TextCellModel.self, ])
    }
}

extension CovidStatsViewController {
    func showData(with cellModels: [PTableViewCellAnyModel]) {
        self.cellModels = cellModels
    }
}

extension CovidStatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withModel: cellModels[indexPath.row], for: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
}
extension CovidStatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

