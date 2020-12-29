//
//  TaskListViewController.swift
//  ToDoAppWithTest
//
//  Created by Rotach Roman on 12.12.2020.
//

import UIKit

class TaskListViewController: UIViewController {
    
    var tableView: UITableView!
    var dataProvider: DataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        dataProvider = DataProvider()
        
        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
        
        tableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
    }
}

