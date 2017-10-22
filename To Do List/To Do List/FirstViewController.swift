//
//  FirstViewController.swift
//  To Do List
//
//  Created by Lambros Tzanetos on 08/08/16.
//  Copyright © 2016 Mogul Asterovska. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = []
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
  
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
    
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        }
        
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items") // first time an item is add i doesn't do anything
        
        
        
        if let tempItems = itemsObject as? [String] { // first time an item is add i doesn't do anything
            
            items = tempItems
            
           

        }
         tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            tableView.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

