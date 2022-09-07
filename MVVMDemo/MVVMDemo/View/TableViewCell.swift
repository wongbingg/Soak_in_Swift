//
//  TableViewCell.swift
//  MVVMDemo
//
//  Created by 이원빈 on 2022/09/04.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupStackView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupStackView() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(numberLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupCellData(with model: Model) {
        numberLabel.text = String(model.number)
        descriptionLabel.text = model.description
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        numberLabel.text = nil
        descriptionLabel.text = nil
    }
}
