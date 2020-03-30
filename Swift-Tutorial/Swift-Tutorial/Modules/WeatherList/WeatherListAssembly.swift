//
//  WeatherListAssembly.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 28.03.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class WeatherListAssembly {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func create() -> WeatherListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: String(describing: WeatherListViewController.self)
        ) as? WeatherListViewController else {
            preconditionFailure("Cannot create WeatherListAssemblyViewController")
        }

        let router = WeatherListRouter(navigationController: navigationController)
        let presenter = WeatherListPresenter(view: viewController, router: router)
        viewController.presenter = presenter

        return viewController
    }
}
