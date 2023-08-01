//
//  BottomView.swift
//  ProfileApp
//
//  Created by Елизавета Ефросинина on 01/08/2023.
//

import UIKit

class BottomView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "O себе"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Experienced software engineer skilled in developing scalable and maintainable systems"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0,
                                 width: 273,
                                 height: 244))
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubviews([titleLabel, textLabel])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: topAnchor),
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
        textLabel.leftAnchor.constraint(equalTo: leftAnchor),
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
