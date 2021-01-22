//
//  SecondViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

protocol SecondViewControllerDelegate {
    func removeItem(_ id: Int)
    func editItem(_ id: Int)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arr = [ToDoItem]()
    let cellId = "TableViewCell"
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        testDataConfigure()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main page"
        self.configureTableView()
    }

    
    func testDataConfigure(){
        arr.append(ToDoItem(id: 1, title: "first", deadLine: "20.12.2021"))
        arr.append(ToDoItem(id: 2, title: "second", deadLine: "22.12.2021"))
        arr.append(ToDoItem(id: 3, title: "third", deadLine: "12.08.2021"))
        arr.append(ToDoItem(id: 4, title: "uno", deadLine: "05.07.2021"))
        arr.append(ToDoItem(id: 5, title: "dos", deadLine: "29.12.2021"))
    }
    
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        //change this method
        //Alert manager with two fields
        tableView.reloadData()
    }
    
}

extension SecondViewController: SecondViewControllerDelegate{
    func removeItem(_ id: Int) {
        //remove item from array
    }
    
    func editItem(_ id: Int) {
        //open new view controller which allows you to change the data of the array item
    }
 
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
//        cell.delegate = self
        cell.id = item.id ?? 0
        cell.titleLabel.text = item.title
        cell.subTitleLabel.text = item.deadLine
        
        cell.editCallback = { id in
            self.editItem(id)
        }
        
        cell.removeCallback = { id in
            self.removeItem(id)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.arr.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        delete.backgroundColor = .red
        delete.image = UIImage(systemName: "trash")
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    
}
