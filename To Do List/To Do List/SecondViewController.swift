//
//  SecondViewController.swift
//  To Do List
//
//  Created by Lambros Tzanetos on 08/08/16.
//  Copyright © 2016 Mogul Asterovska. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addItem_TextField: UITextField!
    
    @IBAction func addItem_AddClicked(_ sender: AnyObject) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items") // first time an item is add i doesn't do anything
        
        var items: [String]
        
        if let tempItems = itemsObject as? [String] { // first time an item is add i doesn't do anything
            
            items = tempItems
            
            items.append(addItem_TextField.text!)
        
        }
        
        else {
            
            items = [addItem_TextField.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        addItem_TextField.text = ""
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

