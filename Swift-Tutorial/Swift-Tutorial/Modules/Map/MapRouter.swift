//
//  MapRouter.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class MapRouter {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showSelectFuel() {
        let fuelSelectVC = FuelSelectAssembly(navigationController: navigationController).create()
        navigationController.topViewController?.present(fuelSelectVC, animated: true)
    }
}
