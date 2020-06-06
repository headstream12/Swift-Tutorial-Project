//
//  StartupAssembly.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 26.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class StartupAssembly {
    func create() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "StartupViewController"
        ) as? StartupViewController else {
            preconditionFailure("Cannot create StartupViewController")
        }

        let navigationController = UINavigationController(rootViewController: viewController)
        let router = StartupRouter(navigationController: navigationController)
        let presenter = StartupPresenter(
            view: viewController,
            router: router,
            weatherAPI: WearherAPI(network: NetworkProvider())
        )
        viewController.presenter = presenter

        return navigationController
    }
}
