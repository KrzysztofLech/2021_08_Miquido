//
//  ListViewController.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

final class ListViewController: UIViewController {
    
    private let contentView = ListView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
