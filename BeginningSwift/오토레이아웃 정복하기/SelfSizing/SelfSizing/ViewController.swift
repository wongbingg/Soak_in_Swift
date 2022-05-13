//
//  ViewController.swift
//  SelfSizing
//
//  Created by 이원빈 on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter
            .default
            .addObserver(
                forName: NSNotification.Name("layoutCell"),
                object: nil,
                queue: OperationQueue.main) { (noti) in
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let customCell = cell as? CustomTableViewCell else {
            return cell
        }
        
        customCell.titleLabel?.text = indexPath.description
        customCell.postLabel?.text = """
            Hello,
            My Name is LeeWonbeen
            Nice to meet you guys
            Currently I learning about ios
            in Yagom Academy Camp
            Now I'm very exciting of it
            So happy to here
            thanks you
            """
        customCell.myImageView?.image = UIImage(named: "\(indexPath.row % 3)")
        return cell
    }
}
