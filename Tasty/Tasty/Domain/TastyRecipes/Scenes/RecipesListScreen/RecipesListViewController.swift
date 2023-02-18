//  RecipesListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран списка рецептов
final class RecipesListViewController: UIViewController {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let tableViewCellIdentifier = "FoodTableViewCell"
        static let marshColorName = "MarshColor"
        static let tastyText = "TASTY"
        static let BackgroundColorName = "BackgroundColor"
        static let fatalErrorOfRequiredInitText = "init(coder:) has not been implemented"
    }
    
    // MARK: - Private Visual Components
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.textColor = UIColor(named: Constants.marshColorName)
        label.textAlignment = .center
        label.text = Constants.tastyText
        return label
    }()
    
    // MARK: Initializers
    
    init(interactor: RecipesListBusinessLogic?, router: RecipesListRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorOfRequiredInitText)
    }
    
    // MARK: - Public Properties
    
    var interactor: RecipesListBusinessLogic?
    var router: RecipesListRoutingLogic?
    
    // MARK: - Private Properties
    
    private var recipes: [Recipe] = []
    private var imagesData: [Data] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func initForm() {
        interactor?.requestInitForm()
        displayRecipesList()
    }
  
    private func displayRecipesList() {
        Task {
            await interactor?.requestRecipesList()
        }
    }
    
    private func displayImage() {
        Task {
            await interactor?.requestData()
        }
    }
    
    private func displayRecipeDetails(index: Int) {
        interactor?.requestId(index: index)
    }
    
    private func setupUI() {
        configureTableView()
        view.backgroundColor = UIColor(named: Constants.BackgroundColorName)
        navigationItem.titleView = recipeTitleLabel
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            RecipesTableViewCell.self,
            forCellReuseIdentifier: Constants.tableViewCellIdentifier
        )
        tableViewConstraint()
    }
    
    private func tableViewConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor )
        ])
    }
}

/// Recipes List Display Logic
extension RecipesListViewController: RecipesListDisplayLogic {
    func displayInitForm(_ viewModel: RecipesListModel.InitForm.ViewModel) {}
    
    func displayRecipeDetails(viewModel: RecipesListModel.IDRecipeDetailsChanged.ViewModel) {}
    
    func displayRecipeList(viewModel: RecipesListModel.RecipesListChanged.ViewModel) {
        recipes = viewModel.recipes
        displayImage()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayImageData(viewModel: RecipesListModel.imagesDataChanged.ViewModel) {
        imagesData = viewModel.recipesImages
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

/// UITableViewDataSource
extension RecipesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier)
                as? RecipesTableViewCell,
              imagesData.count == recipes.count
        else { return UITableViewCell() }
        let recipe = recipes[indexPath.row]
        let recipeImage = imagesData[indexPath.row]
        cell.backgroundColor = UIColor(named: Constants.BackgroundColorName)
        cell.configure(with: recipe, imageData: recipeImage)
        cell.selectionStyle = .none
        return cell
    }
}

/// UITableViewDelegate
extension RecipesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayRecipeDetails(index: indexPath.row)
        router?.routeToRecipeDetails()
    }
}
