//
//  HomeViewController.swift
//  AppLinkExample
//
//  Created by Siqueira on 27/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Attributes
    private var viewModel: HomeViewModelProtocol

    // MARK: - Initializer
    init(viewModel: HomeViewModelProtocol) {
       self.viewModel = viewModel

       super.init(nibName: "HomeViewController", bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinds()
    }

    // MARK: - Functions
    private func setupBinds() {
        viewModel.url.bind { [weak self] url in
            guard let self = self, let url = url else { return }

            self.showActivityViewController(url: url)
        }

        viewModel.error.bind { [weak self] error in
            guard let self = self, let error = error else { return }

            self.showAlert(title: "Error", message: error.localizedDescription)
        }
    }

    // MARK: - Actions
    @IBAction private func didTapOnGenerateLinkDetailScreen(_ sender: UIButton) {
        viewModel.generateDynamicLinkSpecificScreen()
    }

    @IBAction private func didTapGenerateLinkFlow(_ sender: UIButton) {
        viewModel.generateDynamicLinkScreenFlow()
    }

    @IBAction private func didTapOpenDetailScreen(_ sender: UIButton) {
        viewModel.openDetailScene()
    }
}
