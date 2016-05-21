//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Skylar Hansen on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShoppingListController.sharedController.items
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingListController.sharedController.items.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as? ItemTableViewCell
        
        let item = ShoppingListController.sharedController.items[indexPath.row]
        cell?.updateWithItem(item)
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let index = ShoppingListController.sharedController.items[indexPath.row]
            ShoppingListController.sharedController.removeItem(index)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Action Button
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your shopping list", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in textField }
        let createAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            guard let textFields = alertController.textFields,
                firstTextField = textFields.first,
                shoppingListItem = firstTextField.text else { return }
            ShoppingListController.sharedController.addItem(shoppingListItem)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func buttonCellButtonTapped(sender: ItemTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(sender) else { return }
        let item = ShoppingListController.sharedController.items[indexPath.row]
        
        if item.isComplete == false {
            item.isComplete = true
            sender.updateButton(item.isComplete.boolValue)
        } else {
            item.isComplete = false
            sender.updateButton(item.isComplete.boolValue)
        }
        
    }
    
}
