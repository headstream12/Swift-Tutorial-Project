//
//  CovidStatsAssembly.swift
//  Swift-Tutorial
//
//  Created by User on 24/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit
class CovidStatsAssembly {
    func create() -> CovidStatsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
       guard let viewController = storyboard.instantiateViewController(withIdentifier: "CovidStatsViewController"
        ) as? CovidStatsViewController else {
            preconditionFailure("Cannot create CovidStatsViewController")
        }
        
        let presenter = CovidStatsPresenter(
            view: viewController,
            covidAPI: CovidAPI(network: NetworkProvider())
        )
        viewController.presenter = presenter
        
        return viewController
    }
}
