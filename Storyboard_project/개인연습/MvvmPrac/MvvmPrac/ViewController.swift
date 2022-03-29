//
//  ViewController.swift
//  MvvmPrac
//
//  Created by 이원빈 on 2022/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableview:UITableView!
    
    var data = [
        Person(firstName: "Lee", lastName: "wonbeen", gender: "male", age: 25, height: 187),
        Person(firstName: "Lee", lastName: "wonhee", gender: "female", age: 26, height: 150),
        Person(firstName: "Lee", lastName: "dongsub", gender: "male", age: 55, height: 174),
        Person(firstName: "Gu", lastName: "jungim", gender: "female", age: 54, height: 150),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        tableview.delegate = self
        tableview.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let model = data[indexPath.row]
        cell.configure(with: CellViewModel(firstName: model.firstName, lastName: model.lastName))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}

struct Person {
    
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let height: Double
}

struct CellViewModel{
    let firstName: String
    let lastName: String
}
