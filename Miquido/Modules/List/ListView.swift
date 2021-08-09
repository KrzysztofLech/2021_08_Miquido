//
//  ListView.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

final class ListView: UIView {
    
    // MARK: - UI Components -
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        view.color = AppColor.text
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = AppColor.background
        return tableView
    }()
    
    // MARK: - Lifecycle -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup -
    
    private func setup() {
        backgroundColor = AppColor.background
    }
    
    // MARK: - Layout -
    
    private func defineLayout() {
        addActivityView()
        addTableView()
    }
    
    private func addActivityView() {
        addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperView(self)
    }
    
    private func addTableView() {
        insertSubview(tableView, belowSubview: activityIndicatorView)
        tableView.fillInSuperview(self)
    }
    
    // MARK: - Public methods -
    
    func showActivityIndicator(_ show: Bool) {
        if show {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
        
        tableView.isHidden = show
    }
}
