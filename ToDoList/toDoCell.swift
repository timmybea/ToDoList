//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Tim Beals on 2017-01-18.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func setUpLabel(toDo: String) {
        self.label.text = toDo
    }
}
