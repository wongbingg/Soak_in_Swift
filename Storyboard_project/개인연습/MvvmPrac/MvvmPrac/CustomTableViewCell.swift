//
//  CustomTableViewCell.swift
//  MvvmPrac
//
//  Created by 이원빈 on 2022/03/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var myLabel: UILabel!
    
    static let cellIdentifier = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
        
    }
    
    public func configure(with viewModel: CellViewModel) {
        myLabel.text = "\(viewModel.firstName) \(viewModel.lastName)"
    }
}
