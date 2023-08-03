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
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.frame = scrollView.frame
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var contentView: ContentView = {
        let view = ContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var editView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var skillLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Мои навыки"
        
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(editSkills), for: .touchUpInside)
        button.frame.size = CGSize(width: 24, height: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = true
        
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(SkillCollectionViewCell.self, forCellWithReuseIdentifier: "SkillCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    private lazy var bottomView: BottomView = {
        let view = BottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: -- Properties
    private var viewModel: SkillViewModelProtocol
    var collectionViewHeight: NSLayoutConstraint?
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: -- Initializations
    init(viewModel: SkillViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private Methods
    private func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        editView.addSubviews([skillLabel, editButton])
        mainView.addSubviews([contentView, editView, collectionView, bottomView])
        navigationController?.navigationBar.backgroundColor = .systemGray6
        navigationController?.navigationBar.topItem?.title = "Профиль"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.topAnchor.constraint(equalTo: mainView.topAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 244),
            contentView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            editView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            editView.heightAnchor.constraint(equalToConstant: 40),
            editView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            skillLabel.topAnchor.constraint(equalTo: editView.topAnchor, constant: 10),
            skillLabel.leftAnchor.constraint(equalTo: editView.leftAnchor, constant: 10),
            editButton.topAnchor.constraint(equalTo: editView.topAnchor, constant: 10),
            editButton.rightAnchor.constraint(equalTo: editView.rightAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: editView.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            bottomView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            bottomView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
    }
    
    @objc
    private func editSkills() {
        editButton.setImage(UIImage(named: "checkmark"), for: .normal)
        editButton.frame.size = CGSize(width: 24, height: 24)
        //dataSource.skills.append(Skill(title: "+"))
        viewModel.appendSkill(text: "+")
        collectionView.reloadData()
    }
}

//MARK: -- UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfSkills
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillCollectionViewCell", for: indexPath) as? SkillCollectionViewCell else { return .init() }
        let skill = viewModel.getSkill(for: indexPath.row).title
        cell.set(skill: skill)
        
        cell.backgroundColor = .systemGray6
        return cell
    }
}

//MARK: -- UICollectionViewDelegate
extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel.getSkill(for: indexPath.row).title == "+" {
            var userTextField: UITextField?
            
            let alert = UIAlertController(title: "Дбавление навыка",
                                          message: "Введите название навыка, которым вы владеете",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Добавить", style: .default) { (action) in
                guard let newSkill = userTextField?.text else { return }
                
                self.viewModel.appendSkill(text: newSkill)
                
                self.viewModel.removeSkill(text: "+")
                
                self.editButton.setImage(UIImage(named: "pencil"), for: .normal)
                collectionView.reloadData()
            }
            
            let cancel = UIAlertAction(title: "Отмена", style: .cancel)
            alert.addAction(action)
            alert.addAction(cancel)
            
            alert.addTextField { textField in
                userTextField = textField
                userTextField?.placeholder = "Введите название"
            }
            present(alert, animated: true)
        }
    }
}

//MARK: -- UICollectionViewDelegateFlowLayout
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = viewModel.getSkill(for: indexPath.item).title
        label.sizeToFit()
        return CGSize(width: label.frame.width + 10 , height: 44)
    }
}
