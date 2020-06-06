//
//  StrartupPresenter.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 26.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

class StartupPresenter {
    private weak var view: StartupViewController?
    private let router: StartupRouter
    private let weatherAPI: WeatherAPIProtocol

    init(
        view: StartupViewController,
        router: StartupRouter,
        weatherAPI: WeatherAPIProtocol
    ) {
        self.view = view
        self.router = router
        self.weatherAPI = weatherAPI
    }

    func viewDidLoad() {
        let startupViewModel = StartupViewModel(
            title: Strings.Startup.title,
            description: Strings.Startup.description,
            firstButtonTitle: Strings.Startup.firstButtonTitle,
            secondButtonTitle: Strings.Startup.secondButtonTitle
        )

        view?.bindData(with: startupViewModel)
    }

    func didTapWeatherListButton() {
        weatherAPI.loadWeather(by: LocationCoordinate(lat: 53.255933, lon: 50.230419)) { [weak self] result in
            switch result {
            case .success(let responseDTO):
                let covidViewModel = StartupViewModel(
                    title: "Погода сейчас: \((responseDTO.daily.first?.temp.day ?? 0.0) - 273.15) С",
                    description: "Вылечилось:",
                    firstButtonTitle: Strings.Startup.firstButtonTitle,
                    secondButtonTitle: Strings.Startup.secondButtonTitle
                )

                self?.view?.bindData(with: covidViewModel)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        //router.showWeatherList()
    }
}
