//
//  DetailsView.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

final class DetailsView: UIView {
    
    // MARK: - UI Components -
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = AppColor.detailsContent?.cgColor
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .ultraLight)
        label.textColor =  AppColor.detailsContent
        label.numberOfLines = 0
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor =  AppColor.detailsContent
        label.numberOfLines = 0
        return label
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateView()
    }
    
    // MARK: - Setup -
    
    private func setup() {
        backgroundColor = AppColor.detailsBackground
    }
    
    private func updateView() {
        avatarImageView.layer.borderColor = AppColor.detailsContent?.cgColor
    }
    
    // MARK: - Layout -
    
    private func defineLayout() {
        addAvatarImageView()
        addNameLabel()
        addEmailLabel()
    }
    
    private func addAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let screenWidth = UIScreen.main.bounds.width
        let imageViewSize = screenWidth * 0.65
        let imageViewTopInset = (screenWidth - imageViewSize ) / 2
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: imageViewSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: imageViewSize),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: imageViewTopInset)
        ])
    }
    
    private func addNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 120),
            nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 40),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -40)
        ])
    }
    
    private func addEmailLabel() {
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 40),
            emailLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -40)
        ])
    }
    
    // MARK: - Public methods -
    
    func setupName(_ nameText: String) {
        nameLabel.text = nameText
    }

    func setupEmail(_ emailText: String) {
        emailLabel.text = emailText
    }
}

