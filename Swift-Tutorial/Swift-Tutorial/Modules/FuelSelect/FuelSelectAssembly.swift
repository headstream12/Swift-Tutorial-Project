//
//  FuelSelectAssembly.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

 class FuelSelectAssembly {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func create() -> FuelSelectViewController {
        let viewController = FuelSelectViewController()
        let router = FuelSelectRouter(navigationController: navigationController)
        let presenter = FuelSelectPresenter(view: viewController, router: router)
        viewController.presenter = presenter

        return viewController
    }
 }
