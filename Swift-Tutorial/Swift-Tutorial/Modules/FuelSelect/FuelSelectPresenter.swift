//
//  FuelSelectPresenter.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

class FuelSelectPresenter {
    enum State {
        case selectColumn
        case selectFuelType
        case payment
        case paymentType
    }


    private var state: State = .selectColumn

    private weak var view: FuelSelectViewController?
    private let router: FuelSelectRouter

    init(
       view: FuelSelectViewController,
       router: FuelSelectRouter
    ) {
       self.view = view
       self.router = router
    }

    func viewDidLoad() {
        let columns: [FuelNumberCellModel] = [
            FuelNumberCellModel(numberText: "1"),
            FuelNumberCellModel(numberText: "2"),
            FuelNumberCellModel(numberText: "3"),
            FuelNumberCellModel(numberText: "4"),
            FuelNumberCellModel(numberText: "5"),
        ]

        view?.showData(with: columns, title: "Выбор колонки:")
    }

    func didSelectRow() {
        switch state {
        case .selectColumn:
            state = .selectFuelType
            view?.showData(with: fuelTypes, title: "Выбор топлива:")
        case .selectFuelType:
            state = .payment
            view?.showData(with: [PaymentCellModel()], title: "Выбор суммы:")
            print("router show payment screen")
        case .payment:
            break
        case .paymentType:
            view?.showAlert(with: "Оплата прошла успешно", completion: { [router] _ in
                router.popToRoot()
            })
        }
    }

    func didTapPayButton() {
        state = .paymentType
        view?.showData(with: paymentTypes, title: "Выбор способа платежа:")
    }

    var fuelTypes: [FuelNumberCellModel] {
        [
            FuelNumberCellModel(numberText: "92"),
            FuelNumberCellModel(numberText: "95"),
            FuelNumberCellModel(numberText: "98"),
            FuelNumberCellModel(numberText: "100"),
            FuelNumberCellModel(numberText: "ДТ"),
            FuelNumberCellModel(numberText: "ГАЗ"),
        ]
    }

    var paymentTypes: [FuelNumberCellModel] {
        [
            FuelNumberCellModel(numberText: "Apple Pay"),
            FuelNumberCellModel(numberText: "Visa / MasterCard")
        ]
    }
}
