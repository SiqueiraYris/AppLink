//
//  DetailCoordinator.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class DetailCoordinator: Coordinator {
    // MARK: - Attributes
    private var presenter: UINavigationController?

    // MARK: - Initializer
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = DetailViewModel(coordinator: self)
        let viewController = DetailViewController(viewModel: viewModel)

        presenter?.pushViewController(viewController, animated: true)
    }
}
