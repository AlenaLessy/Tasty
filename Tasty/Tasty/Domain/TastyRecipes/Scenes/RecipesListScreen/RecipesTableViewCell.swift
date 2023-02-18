//  RecipesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class RecipesTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let marshColorName = "MarshColor"
        static let portionImageName = "portion"
        static let caloriesText = "calories -"
        static let kcalText = "kcal"
    }
    
    // MARK: - Private Visual Components
    
    private var recipesBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Constants.marshColorName)
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let caloriesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26)
        label.textColor = .white
        
        return label
    }()
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let portionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.portionImageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let portionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureLayoutAnchor()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Public Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        foodImageView.image = nil
        caloriesLabel.text = nil
        portionLabel.text = nil
    }
    
    func configure(with viewModel: Recipe, imageData: Data) {
        caloriesLabel.text = "\(Constants.caloriesText) \(Int(viewModel.calories)) \(Constants.kcalText)"
        titleLabel.text = viewModel.label
        foodImageView.image = UIImage(data: imageData)
        portionLabel.text = "\(viewModel.yield)"
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        contentView.addSubview(recipesBackgroundView)
        recipesBackgroundView.addSubview(caloriesLabel)
        recipesBackgroundView.addSubview(titleLabel)
        recipesBackgroundView.addSubview(foodImageView)
        recipesBackgroundView.addSubview(portionImageView)
        recipesBackgroundView.addSubview(portionLabel)
    }
    
    private func configureLayoutAnchor() {
        recipesBackgroundViewConstrains()
        foodImageViewConstraints()
        recipeTitleLabelConstraints()
        caloriesLabelConstraints()
        portionImageViewConstraints()
        portionLabelConstraints()
    }
    
    private func recipesBackgroundViewConstrains() {
        NSLayoutConstraint.activate([
            recipesBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            recipesBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            recipesBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            recipesBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func foodImageViewConstraints() {
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: recipesBackgroundView.topAnchor, constant: 5),
            foodImageView.leadingAnchor.constraint(equalTo: recipesBackgroundView.leadingAnchor, constant: 5),
            foodImageView.trailingAnchor.constraint(equalTo: recipesBackgroundView.trailingAnchor, constant: -5),
            foodImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func recipeTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: recipesBackgroundView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 30),
        ])
    }
    
    private func caloriesLabelConstraints() {
        NSLayoutConstraint.activate([
            caloriesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            caloriesLabel.leadingAnchor.constraint(equalTo: recipesBackgroundView.leadingAnchor, constant: 20),
            caloriesLabel.widthAnchor.constraint(equalToConstant: 250),
            caloriesLabel.bottomAnchor.constraint(equalTo: recipesBackgroundView.bottomAnchor, constant: -5)
        ])
    }
    
    private func portionLabelConstraints() {
        NSLayoutConstraint.activate([
            portionLabel.topAnchor.constraint(equalTo: caloriesLabel.topAnchor),
            portionLabel.trailingAnchor.constraint(equalTo: recipesBackgroundView.trailingAnchor, constant: -29),
            portionLabel.widthAnchor.constraint(equalToConstant: 29),
            portionLabel.heightAnchor.constraint(equalToConstant: 29),
            portionLabel.bottomAnchor.constraint(equalTo: caloriesLabel.bottomAnchor)
        ])
    }
    
    private func portionImageViewConstraints() {
        NSLayoutConstraint.activate([
            portionImageView.topAnchor.constraint(equalTo: caloriesLabel.topAnchor),
            portionImageView.trailingAnchor.constraint(equalTo: portionLabel.leadingAnchor, constant: 0),
            portionImageView.widthAnchor.constraint(equalToConstant: 30),
            portionImageView.heightAnchor.constraint(equalToConstant: 30),
            portionImageView.bottomAnchor.constraint(equalTo: caloriesLabel.bottomAnchor)
        ])
    }
}

