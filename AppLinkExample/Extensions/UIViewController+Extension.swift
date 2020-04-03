//
//  UIViewController+Extension.swift
//  AppLinkExample
//
//  Created by Siqueira on 30/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit


extension UIViewController {
    // MARK: - Show Alert
    func showAlert(title: String? = nil, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Show Activity View Controller
    func showActivityViewController(url: URL) {
        let activityViewController = UIActivityViewController(activityItems: ["App Link", url],
                                                              applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.airDrop, .addToReadingList]
        self.present(activityViewController, animated: true, completion: nil)
    }
}
