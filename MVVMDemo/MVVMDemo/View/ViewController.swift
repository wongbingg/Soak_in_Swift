//
//  ViewController.swift
//  MVVMDemo
//
//  Created by 이원빈 on 2022/09/04.
//

import UIKit

final class ViewController: UIViewController {
    private var viewModel = ViewModel(models: mockData)
    private var tableView: TableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = TableView(with: viewModel)
        setupInitialView()
        setupNavigationBar()
        configureTableView()
    }
    
    private func setupInitialView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonDidTapped)
        )
    }
    private func configureTableView() {
        guard let tableView = tableView else { return }
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    @objc private func addButtonDidTapped() {
        viewModel.create(with: Model(number: 0, description: "추가") )
    }
}

