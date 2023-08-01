//
//  ProfileViewController.swift
//  ProfileApp
//
//  Created by Елизавета Ефросинина on 01/08/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: -- GUI Variables
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
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
       // view.image
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([imageView, nameLabel, informationLabel, locationImage, locationLabel])
        navigationController?.navigationBar.backgroundColor = .systemGray6
        navigationController?.navigationBar.topItem?.title = "Профиль"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            contentView.heightAnchor.constraint(equalToConstant: 244),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            //informationStackView.heightAnchor.constraint(equalToConstant: 244),
           // informationStackView.widthAnchor.constraint(equalToConstant: 273),
           // informationStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 149),
            nameLabel.heightAnchor.constraint(equalToConstant: 64),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            informationLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            informationLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            informationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            locationImage.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 5),
            locationImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30),
            locationLabel.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 5),
            locationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 10)
            
        ])
    }
}
