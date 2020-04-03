//
//  AppLinkHandler.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation
import Firebase

enum AppLinkType {
    case appLinkSpecificScreen
    case appLinkFlow
}

final class AppLinkHandler {
    func generateAppLink(type: AppLinkType, title: String, description: String, completion: @escaping (Result<URL, Error>) -> Void) {
        var components = URLComponents()
        components.scheme = uriScheme
        components.host = serverHost

        switch type {
        case .appLinkSpecificScreen:
            components.path = pathSpecificScreen

        case .appLinkFlow:
            components.path = pathFlow
//            let noticeIDQuery = URLQueryItem(name: pathFlow, value: "10")
//            components.queryItems = [noticeIDQuery]
        }

        guard let linkParameter = components.url else { return }
        guard let shareLink = DynamicLinkComponents.init(link: linkParameter,
                                                         domainURIPrefix: domainURIPrefix) else { return }

        if let bundle = Bundle.main.bundleIdentifier {
            shareLink.iOSParameters = DynamicLinkIOSParameters(bundleID: bundle)
        }
//        shareLink.iOSParameters?.appStoreID = "9314275830"
        shareLink.iOSParameters?.iPadFallbackURL = URL(string: fallbackUrl)
        shareLink.otherPlatformParameters = DynamicLinkOtherPlatformParameters()
        shareLink.otherPlatformParameters?.fallbackUrl = URL(string: fallbackUrl)
        shareLink.androidParameters = DynamicLinkAndroidParameters(packageName: androidPackage)

        shareLink.socialMetaTagParameters = DynamicLinkSocialMetaTagParameters()
        shareLink.socialMetaTagParameters?.title = title
        shareLink.socialMetaTagParameters?.descriptionText = description
        let imageUrl = URL(string: appLinkImage)
        shareLink.socialMetaTagParameters?.imageURL = imageUrl

        shareLink.shorten { url, _, error in
            if let err = error {
                completion(.failure(err))
            }
            guard let url = url else { return }
            completion(.success(url))
        }
    }
}
