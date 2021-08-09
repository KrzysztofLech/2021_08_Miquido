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
        
    // MARK: - Init -
    
    init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
    }
    
    // MARK: - Module methods -
    
    func start() {
        showList()
    }
    
    private func showList() {
        let listViewController = ListViewController()
        window?.rootViewController = listViewController
        window?.makeKeyAndVisible()
    }
    
}

// MARK: - Root Coordinator delegate methods -

extension RootCoordinator: RootCoordinatorDelegate {
}
