//
//  MapPresenter.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

class MapPresenter {
    weak var view: MapViewController?
    private let router: MapRouter

    init(router: MapRouter) {
        self.router = router
    }

    func viewDidLoad() {
        
    }

    func didSelectAnotation() {
        router.showSelectFuel()
    }
}
