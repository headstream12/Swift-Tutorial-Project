//
//  FuelSelectRouter.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

 class FuelSelectRouter {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func popToRoot() {
        navigationController.topViewController?.dismiss(animated: true, completion: nil)
    }
 }
