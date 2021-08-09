//
//  DetailsViewController.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

final class DetailsViewController: UIViewController {
        
    // MARK: - Private properties -
    
    private let viewModel: DetailsViewModelProtocol
    private let contentView = DetailsView()
    
    // MARK: - Lifecycle -
    
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Setup view -
    
    private func setupView() {
        title = "Datum details"
        contentView.setupName(viewModel.nameText)
        contentView.setupEmail(viewModel.emailText)
        contentView.showAvatarImage(viewModel.avatarStringUrl)
    }
}
