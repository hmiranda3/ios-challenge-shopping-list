//
//  ShoppingList+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Skylar Hansen on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ShoppingList {

    @NSManaged var name: String
    @NSManaged var isComplete: NSNumber

}
