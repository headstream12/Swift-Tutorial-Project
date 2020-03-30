//
//  StartupRouter.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 26.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class StartupRouter {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showWeatherList() {
        let weatherListVC = WeatherListAssembly(navigationController: navigationController).create()
        navigationController.pushViewController(weatherListVC, animated: true)
    }
}
