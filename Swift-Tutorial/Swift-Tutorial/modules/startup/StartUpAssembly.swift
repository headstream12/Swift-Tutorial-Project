//
//  StartUpAssembly.swift
//  Swift-Tutorial
//
//  Created by User on 24/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit
class StartUpAssembly {
    func create() -> StartUpViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
       guard let viewController = storyboard.instantiateViewController(withIdentifier: "StartUpViewController"
        ) as? StartUpViewController else {
            preconditionFailure("Cannot create StartUpViewController")
        }
        
        let presenter = StartUpPresenter(view: viewController)
        viewController.presenter = presenter
        
        return viewController
    }
}
