//
//  MapAssembly.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class MapAssembly {
     func create() -> UINavigationController {
        let viewController = MapViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let router = MapRouter(navigationController: navigationController)
        let presenter = MapPresenter(router: router)

        presenter.view = viewController
        viewController.presenter = presenter

        return navigationController
     }
}
