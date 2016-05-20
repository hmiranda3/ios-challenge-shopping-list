//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Skylar Hansen on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListController {
    
    static let sharedController = ShoppingListController()
    
    let moc = Stack.sharedStack.managedObjectContext
    
    var items: [ShoppingList] {
        
        let request = NSFetchRequest(entityName: "ShoppingList")
        
        return (try? moc.executeFetchRequest(request)) as? [ShoppingList] ?? []
    }
    
    func addItem(name: String) {
        let _ = ShoppingList(name: name)
        saveToPersistentStore()
    }
    
    func removeItem(shoppingList: ShoppingList) {
        shoppingList.managedObjectContext?.deleteObject(shoppingList)
        saveToPersistentStore()
    }
    
    func isCompleteValueChanged(item: ShoppingList) {
        item.isComplete = !item.isComplete.boolValue
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try moc.save()
        } catch {
            print("There was a problem saving to persistent store")
        }
    }
}
