//
//  RootCoordinator.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

protocol Coordinator {
    func start()
}

final class RootCoordinator: NSObject, Coordinator {
    
    // MARK: - Properties -
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    private let dataService: DataServiceProtocol
        
    // MARK: - Init -
    
    init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
        self.dataService = DataService()
    }
    
    // MARK: - Module methods -
    
    func start() {
        showList()
    }
    
    private func showList() {
        let listViewModel = ListViewModel(dataService: dataService)
        let listViewController = ListViewController(viewModel: listViewModel)
        listViewController.delegate = self
        
        navigationController = UINavigationController(rootViewController: listViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func showDatumDetails(_ datum: Datum) {
        let detailsViewModel = DetailsViewModel(datum: datum)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

// MARK: - ListViewController delegate methods -

extension RootCoordinator: ListViewControllerDelegate {
    func showAlert(title: String, message: String, errorHandler: @escaping () -> ()) {
        let errorAction = UIAlertAction(
            title: "Try again",
            style: .default) { _ in
            errorHandler()
        }
        
        let alerController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alerController.addAction(errorAction)
        
        navigationController?.present(alerController, animated: true)
    }
    
    func didSelectDatum(_ datum: Datum) {
        showDatumDetails(datum)
    }
}
