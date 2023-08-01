//
//  ContentView.swift
//  ProfileApp
//
//  Created by Елизавета Ефросинина on 01/08/2023.
//

import UIKit

class ContentView: UIView {
    //MARK: -- GUI Variables
    private lazy var locationView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 5
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Ellipse 1")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.text = "Иванов Иван Иванович"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.text = "Middle IOS-разработчик, опыт более 2-х лет"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.text = "Воронеж"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var locationImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Frame")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        
        return view
    }()
    
    //MARK: -- Initialization
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0,
                                 width: 273,
                                 height: 244))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private Methods
    private func setupUI() {
        backgroundColor = .systemGray6
        addSubviews([imageView, nameLabel, informationLabel, locationImage, locationLabel])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 149),
            nameLabel.heightAnchor.constraint(equalToConstant: 64),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            informationLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            informationLabel.widthAnchor.constraint(equalTo: widthAnchor),
            informationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            locationImage.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 5),
            locationImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -30),
            locationLabel.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 5),
            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10)
        ])
    }
}
