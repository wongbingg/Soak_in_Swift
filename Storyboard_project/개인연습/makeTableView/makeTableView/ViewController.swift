//
//  ViewController.swift
//  makeTableView
//
//  Created by 이원빈 on 2022/02/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    let user = ["Lee","Choen","Koo","Han","Lim","Kim"]
    let dis = ["hello","hi","bonjur","I'm on working","my favorie","lol"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.nameTitle.text = user[indexPath.row]
        cell.discripTitle.text = dis[indexPath.row]

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //셀 높이설정을 위해 함수사용..?!
           return 80
       }
    
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var discripTitle: UILabel!
}
