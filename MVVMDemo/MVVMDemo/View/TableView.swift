//
//  TableView.swift
//  MVVMDemo
//
//  Created by 이원빈 on 2022/09/04.
//

import UIKit

final class TableView: UITableView {
    
    var viewModel: ViewModel!
    
    init(with viewModel: ViewModel) {
        super.init(frame: .zero, style: .plain)
        self.viewModel = viewModel
        viewModel.delegate = self
        dataSource = self
        delegate = self
        viewModel.modelChanged = { [weak self] in
            self?.reloadData()
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.read().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let model = viewModel.read()[indexPath.row]
        cell.setupCellData(with: model)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension TableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let models = viewModel.read()
        viewModel.delete(model: models[indexPath.row])
    }
}

extension TableView: ViewModelProtocol {
    func didUpdateModel() {
//        reloadData()
    }
}
