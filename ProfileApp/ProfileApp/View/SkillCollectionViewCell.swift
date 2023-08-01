//
//  SkillCollectionViewCell.swift
//  ProfileApp
//
//  Created by Елизавета Ефросинина on 01/08/2023.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    //MARK: -- GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cross"), for: .normal)
        button.addTarget(self, action: #selector(deleteSkills), for: .touchUpInside)
        button.frame.size = CGSize(width: 15, height: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    //MARK: -- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        addSubviews([titleLabel, deleteButton])
        layer.cornerRadius = 10
        layer.masksToBounds = false
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(skill: String) {
        titleLabel.text = skill
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            deleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    @objc
    private func deleteSkills() {
        
    }
}
