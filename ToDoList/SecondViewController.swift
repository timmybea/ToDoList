//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Tim Beals on 2017-01-18.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addButtonTouched(_ sender: Any) {
        var toDoItems = UserDefaults.standard.object(forKey: "items") as? [String]
        if toDoItems != nil {
            let newItem = textField.text
            if newItem != nil {
                toDoItems?.append(newItem!)
            }
            UserDefaults.standard.set(toDoItems, forKey: "items")
        }
        self.textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

