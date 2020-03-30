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

    init(
        view: StartupViewController,
        router: StartupRouter
    ) {
        self.view = view
        self.router = router
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
        router.showWeatherList()
    }
}
