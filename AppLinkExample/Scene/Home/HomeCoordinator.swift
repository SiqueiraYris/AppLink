//
//  HomeCoordinator.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {
    // MARK: - Attributes
    private var presenter: UINavigationController?
    private var startFlow: Bool

    // MARK: - Initializer
    init(presenter: UINavigationController?, startFlow: Bool = false) {
        self.presenter = presenter
        self.startFlow = startFlow
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)

        presenter?.pushViewController(viewController, animated: true)

        if startFlow {
            let detailCoordinator = DetailCoordinator(presenter: presenter)
            detailCoordinator.start()
        }
    }

    // MARK: - Navigations
    func openDetailScene() {
        let detailCoordinator = DetailCoordinator(presenter: presenter)
        detailCoordinator.start()
    }
}
