//
//  DetailViewModel.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - DetailViewModelProtocol
protocol DetailViewModelProtocol {}

final class DetailViewModel: DetailViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: DetailCoordinator?

    // MARK: - Initializer
    init(coordinator: DetailCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
