//
//  CategoryViewController.swift
//  Todoey
//
//  Created by 이원빈 on 2022/01/19.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext// AppDelegate에 접근하는 방법 () 괄호 안에 복잡
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)) // where the data is being stored for our current app
        
        loadCategories()
    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]
        
        cell.textLabel?.text = category.name

        return cell
    }
    
    //MARK: - TableView Delegate Methos
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    func saveCategories() { //Create Update Delete
        
        
        do {
            try context.save()
        } catch{
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData() //이 부분을 통해 show가 가능함
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) { //READ, Item.fetch.. 이라는 default Value를 주어줌 그래서 loadItem() 이렇게 부르기가능
        
        do{
            categoryArray = try context.fetch(request)
        }catch{
            print("Error loading categories \(error)")
        }
        
        tableView.reloadData()
    }
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert) //알림메세지
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //what will happen once the clicks the Add Item button on our UIAlert
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!

            self.categoryArray.append(newCategory) // categoryArray에 append 는 된다 (디버깅으로 브레이크 포인트 잡고 확인함) but showing 이 안됨
            
            self.saveCategories()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Category"
            textField = alertTextField //alertTextField 를 밖으로 꺼내 쓰기위해 textField 에 담아준다
            
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

    
    
    
}
