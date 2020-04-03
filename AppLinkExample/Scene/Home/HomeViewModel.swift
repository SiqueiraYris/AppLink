//
//  HomeViewModel.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation
import Firebase

// MARK: - HomeViewModelProtocol
protocol HomeViewModelProtocol {
    var url: Dynamic<URL?> { get }
    var error: Dynamic<Error?> { get }

    func openDetailScene()
    func generateDynamicLinkScreenFlow()
    func generateDynamicLinkSpecificScreen()
}

final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: HomeCoordinator?
    private var appLinkHandler: AppLinkHandler
    var url: Dynamic<URL?> = Dynamic(nil)
    var error: Dynamic<Error?> = Dynamic(nil)

    // MARK: - Initializer
    init(coordinator: HomeCoordinator? = nil, appLinkHandler: AppLinkHandler = AppLinkHandler()) {
        self.coordinator = coordinator
        self.appLinkHandler = appLinkHandler
    }

    // MARK: - Functions
    func openDetailScene() {
        coordinator?.openDetailScene()
    }

    func generateDynamicLinkScreenFlow() {
        appLinkHandler.generateAppLink(type: .appLinkFlow, title: "Open screens flow", description: "App Link") { [weak self] (result: Result<URL, Error>) in
            guard let self = self else { return }

            switch result {
            case .success(let dataSource):
                self.url.value = dataSource

            case .failure(let error):
                self.error.value = error
            }
        }
    }

    func generateDynamicLinkSpecificScreen() {
        appLinkHandler.generateAppLink(type: .appLinkSpecificScreen, title: "Open specific screen", description: "App Link") { [weak self] (result: Result<URL, Error>) in
            guard let self = self else { return }

            switch result {
            case .success(let dataSource):
                self.url.value = dataSource

            case .failure(let error):
                self.error.value = error
            }
        }
    }
}
