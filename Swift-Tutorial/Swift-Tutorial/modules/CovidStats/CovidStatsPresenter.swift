//
//  CovidStatsRouter.swift
//  Swift-Tutorial
//
//  Created by User on 24/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation
import UIKit

class CovidStatsPresenter {
    weak var view: CovidStatsViewController?
    private let covidAPI: CovidAPIProtocol
    
    init(
        view: CovidStatsViewController,
        covidAPI: CovidAPIProtocol
    ) {
        self.view = view
        self.covidAPI = covidAPI
    }
    
    func viewDidLoad(){
       
    }
}
