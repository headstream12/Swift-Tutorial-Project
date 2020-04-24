//
//  ViewController.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 14.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {
    @IBOutlet weak var TableView: UIView!
    
    var presenter: StartUpPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {

    }
}

extension StartUpViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let ImageCell = tableView.dequeueReusableCell(
            withIdentifier:String(describing: ImageCell.self),
            for: indexPath
            ) as? ImageCell else {
                fatalError("Wrong identifier")
        }
        return ImageCell
    }
    
    
}
extension StartUpViewController: UITableViewDelegate {
    
}
