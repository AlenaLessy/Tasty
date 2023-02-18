//  RecipeDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран рецепта
final class RecipeDetailsViewController: UIViewController {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let backgroundColorName = "BackgroundColor"
        static let loadingText = "Loading..."
        static let marshColor = "MarshColor"
        static let tinderAppText = "Tinder App"
        static let favoriteImageName = "favorite"
        static let separatorText = "\n"
        static let fatalErrorOfRequiredInitText = "init(coder:) has not been implemented"
    }
    
    // MARK: - Private Visual Components
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(named: Constants.marshColor)
        return imageView
    }()
    
    private lazy var showTinderButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(showTinderButtonAction), for: .touchUpInside)
        btn.backgroundColor = UIColor(named: Constants.marshColor)
        btn.setTitle(Constants.tinderAppText, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    private lazy var favoritesButton: UIButton = {
        let btn = UIButton()
        let originalImage = UIImage(named: Constants.favoriteImageName)
        let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage (tintedImage, for: .normal)
        btn.tintColor = UIColor(named: Constants.marshColor)
        btn.addTarget(self, action: #selector(favoritesButtonAction), for: .touchUpInside)
        return btn
    }()
    
    private let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.textColor = UIColor(named: Constants.marshColor)
        label.textAlignment = .center
        return label
    }()
    
    private let compoundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        label.textColor = UIColor(named: Constants.marshColor)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Public Properties
    
    var interactor: RecipeDetailsBusinessLogic?
    var router: RecipeDetailsRoutingLogic?
    
    // MARK: Initializers
    
    init(interactor: RecipeDetailsBusinessLogic?, router: RecipeDetailsRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorOfRequiredInitText)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        initForm()
    }
    
    // MARK: - Private Methods
    
    @objc private func showTinderButtonAction() {
        showTinder()
    }
    
    @objc private func favoritesButtonAction() {
        displayFavorite()
    }
    
    private func addConstraints() {
        foodImageViewConstraint()
        favoritesButtonConstraint()
        recipeTitleLabelConstraint()
        tinderButtonConstraint()
        compoundLabelConstraint()
    }
    
    private func addSubViews() {
        view.addSubview(foodImageView)
        view.addSubview(favoritesButton)
        view.addSubview(recipeTitleLabel)
        view.addSubview(showTinderButton)
        view.addSubview(compoundLabel)
    }
    
    private func initForm() {
        interactor?.requestInitForm()
        displayRecipeDetailsList()
    }
    
    private func displayFavorite() {
        interactor?.requestFavorite()
    }
    
    private func showTinder() {
        interactor?.requestShowTinder()
    }
    
    private func displayRecipeDetailsList() {
        Task {
            await interactor?.requestRecipesList()
        }
    }
    
    private func foodImageViewConstraint() {
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: view.topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func favoritesButtonConstraint() {
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: -100),
            favoritesButton.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: -100),
            favoritesButton.widthAnchor.constraint(equalToConstant: 100),
            favoritesButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func recipeTitleLabelConstraint() {
        NSLayoutConstraint.activate([
            recipeTitleLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 15),
            recipeTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recipeTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func compoundLabelConstraint() {
        NSLayoutConstraint.activate([
            compoundLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor, constant: 15),
            compoundLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            compoundLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func tinderButtonConstraint() {
        NSLayoutConstraint.activate([
            showTinderButton.topAnchor.constraint(greaterThanOrEqualTo: compoundLabel.bottomAnchor, constant: 30),
            showTinderButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            showTinderButton.heightAnchor.constraint(equalToConstant: 70),
            showTinderButton.widthAnchor.constraint(equalToConstant: 200),
            showTinderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}

/// Recipes List Display Logic
extension RecipeDetailsViewController: RecipeDetailsDisplayLogic {
    func displayFavorite(_ viewModel: RecipeDetailsModel.FavoriteChanged.ViewModel) {
        favoritesButton.tintColor = .red
    }
    
    func displayInitForm(_ viewModel: RecipeDetailsModel.InitForm.ViewModel) {
        view.backgroundColor = UIColor(named: Constants.backgroundColorName)
        addSubViews()
        addConstraints()
        recipeTitleLabel.text = Constants.loadingText
    }
    
    func displayRecipeDetails(viewModel: RecipeDetailsModel.RecipeDetailsChanged.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.recipeTitleLabel.text = viewModel.recipe.label
            self?.compoundLabel.text = viewModel.recipe.ingredients.map { "\($0.text)" }.joined(separator: Constants.separatorText)
            self?.foodImageView.image = UIImage(data: viewModel.imageData)
        }
    }
    
    func displayShowTinder(viewModel: RecipeDetailsModel.ShowTinderApp.ViewModel) {
        router?.routeToTinder(url: viewModel.url)
    }
}
