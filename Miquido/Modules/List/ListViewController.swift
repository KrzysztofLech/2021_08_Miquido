//
//  ListViewController.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

final class ListViewController: UIViewController {
    
    // MARK: - Private properties -
    
    private let viewModel: ListViewModelProtocol
    private let contentView = ListView()
    
    // MARK: - Lifecycle -
    
    init(viewModel: ListViewModelProtocol) {
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
        
        fetchData()
    }
    
    // MARK: - Data methods -
    
    private func fetchData() {
        viewModel.fetchData { [weak self] errorText in
            guard let errorText = errorText else {
                print(self?.viewModel.data.count)
                return
            }
            
            print(errorText)
        }
    }
}
