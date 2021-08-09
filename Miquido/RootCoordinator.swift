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

protocol RootCoordinatorDelegate: AnyObject {
}

final class RootCoordinator: NSObject, Coordinator {
    
    // MARK: - Properties -
    
    private var window: UIWindow?
    
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
        window?.rootViewController = listViewController
        window?.makeKeyAndVisible()
    }
}

// MARK: - Root Coordinator delegate methods -

extension RootCoordinator: RootCoordinatorDelegate {
}
