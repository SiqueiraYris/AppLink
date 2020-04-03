//
//  DetailViewController.swift
//  AppLinkExample
//
//  Created by Siqueira on 27/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    // MARK: - Attributes
    private var viewModel: DetailViewModelProtocol

    // MARK: - Initializer
    init(viewModel: DetailViewModelProtocol) {
       self.viewModel = viewModel

       super.init(nibName: "DetailViewController", bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
