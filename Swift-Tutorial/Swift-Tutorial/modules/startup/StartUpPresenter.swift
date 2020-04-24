//
//  StartUpRouter.swift
//  Swift-Tutorial
//
//  Created by User on 24/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

class StartUpPresenter {
    weak var view: StartUpViewController?
    
    init(view: StartUpViewController) {
        self.view = view
    }
    
    func viewDidLoad(){
        
    }
}
