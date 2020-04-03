//
//  ConfigurationConstants.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

private let configurationJson: [String: Any]? = {
    guard
        let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
        let dicInfo = NSDictionary(contentsOfFile: path),
        let dicConfig = dicInfo["Configurations"] as? [String: Any]
        else { return nil }

    return dicConfig
}()

var serverHost: String = {
    guard let serverHost = configurationJson?["host"] as? String else { return "" }

    return serverHost
}()

var uriScheme: String = {
    guard let uriScheme = configurationJson?["scheme"] as? String else { return "" }

    return uriScheme
}()

var domainURIPrefix: String = {
    guard let domainURIPrefix = configurationJson?["domainURIPrefix"] as? String else { return "" }

    return domainURIPrefix
}()

var androidPackage: String = {
    guard let androidPackage = configurationJson?["androidPackage"] as? String else { return "" }

    return androidPackage
}()

var fallbackUrl: String = {
    guard let fallbackUrl = configurationJson?["fallbackUrl"] as? String else { return "" }

    return fallbackUrl
}()

var appLinkImage: String = {
    guard let appLinkImage = configurationJson?["appLinkImage"] as? String else { return "" }

    return appLinkImage
}()

var pathSpecificScreen: String = {
    guard let pathSpecificScreen = configurationJson?["pathSpecificScreen"] as? String else { return "" }

    return pathSpecificScreen
}()

var pathFlow: String = {
    guard let pathFlow = configurationJson?["pathFlow"] as? String else { return "" }

    return pathFlow
}()
