//
//  ApplicationCoordinator.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    // MARK: - Attributes
    private static var window: UIWindow? = {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        return sceneDelegate?.window
    }()

    // MARK: - Life Cycle
    static func start() {
        startApp()
    }

    private static func startApp() {
        let navigation = UINavigationController()

        let homeCoordinator = HomeCoordinator(presenter: navigation)
        homeCoordinator.start()

        window?.rootViewController = navigation
    }

    static func handleAppLink(url: URL) {
        let navigation = UINavigationController()

        let isSpecificScreen = url.description.contains("detail")

        if isSpecificScreen {
            let detailCoordinator = DetailCoordinator(presenter: navigation)
            detailCoordinator.start()
        } else {
            let homeCoordinator = HomeCoordinator(presenter: navigation, startFlow: true)
            homeCoordinator.start()
        }

        window?.rootViewController = navigation
    }
}
