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
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cross"), for: .normal)
        button.addTarget(self, action: #selector(deleteSkills), for: .touchUpInside)
        button.frame.size = CGSize(width: 15, height: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        
        return button
    }()
    
    //MARK: -- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews([titleLabel, deleteButton])
        backgroundView = UIView(frame: .zero)
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Methods
    func set(skill: String) {
        titleLabel.text = skill
        if skill == "+" {
            deleteButton.isHidden = true
        }
    }
    
    //MARK: -- Private Methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            deleteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 1)
        ])
    }
    
    @objc
    private func deleteSkills() {
        
    }
}
