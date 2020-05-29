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
    private let covidAPI: CovidAPIProtocol

    init(
        view: StartupViewController,
        router: StartupRouter,
        covidAPI: CovidAPIProtocol
    ) {
        self.view = view
        self.router = router
        self.covidAPI = covidAPI
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
        covidAPI.loadStatistic(by: "Russia") { [weak self] result in
            switch result {
            case .success(let responseDTO):
                let covidViewModel = StartupViewModel(
                    title: "Всего случаев: \(responseDTO.data.covidStats.first?.confirmed ?? 0)",
                    description: "Вылечилось: \(responseDTO.data.covidStats.first?.recovered ?? 0)",
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
