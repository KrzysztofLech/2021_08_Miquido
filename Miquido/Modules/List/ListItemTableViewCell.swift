//
//  ListItemTableViewCell.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

final class ListItemTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let containerPadding: CGFloat = 20
        static let labelPadding: CGFloat = 16
    }
    
    // MARK: - UI Components -
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.cellBackground
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textColor =  AppColor.cellContent
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Lifecycle -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup -
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    // MARK: - Layout -
    
    private func defineLayout() {
        addContainerView()
        addLabel()
    }
    
    private func addContainerView() {
        addSubview(containerView)
        
        let inset = UIEdgeInsets(top: Constants.containerPadding,
                                 left: Constants.containerPadding,
                                 bottom: 0,
                                 right: Constants.containerPadding)
        containerView.fillInSuperview(self, withInset: inset)
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func addLabel() {
        containerView.addSubview(label)
        
        let inset = UIEdgeInsets(top: Constants.labelPadding,
                                 left: Constants.labelPadding,
                                 bottom: Constants.labelPadding,
                                 right: Constants.labelPadding)
        label.fillInSuperview(containerView, withInset: inset)
    }
    
    // MARK: - Public methods -
    
    func configure(withText text: String) {
        label.text = text
    }
}
