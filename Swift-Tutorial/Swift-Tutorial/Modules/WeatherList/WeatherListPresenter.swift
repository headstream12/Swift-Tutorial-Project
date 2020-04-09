//
//  WeatherListPresenter.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 28.03.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

class WeatherListPresenter {
    private weak var view: WeatherListViewController?
    private let router: WeatherListRouter

    init(
        view: WeatherListViewController,
        router: WeatherListRouter
    ) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {
        let weather = Weather(temperature: 30, date: Date(), wet: 10, rainChance: 12)

        let cellModels: [PTableViewCellAnyModel] = [
            WeatherListHeaderCellModel(weather: weather)
        ]

        view?.showData(with: cellModels)
    }
}
