//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Tim Beals on 2017-01-18.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var datasource: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.isEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let items = UserDefaults.standard.object(forKey: "items") as! [String]? {
                self.datasource = items
        }
        tableView.reloadData()
    } 
    
    //MARK: Tableview delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowCount = datasource?.count {
            return rowCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoCell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as! ToDoCell
        if let toDo = datasource?[indexPath.row] {
            cell.setUpLabel(toDo: toDo)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.datasource?.remove(at: indexPath.row)
            UserDefaults.standard.set(datasource, forKey: "items")
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if let itemToMove = datasource?[sourceIndexPath.row] {
            datasource?.remove(at: sourceIndexPath.row)
            datasource?.insert(itemToMove, at: destinationIndexPath.row)
        }
        UserDefaults.standard.set(datasource, forKey: "items")
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

