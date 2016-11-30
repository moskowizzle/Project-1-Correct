//
//  DataModel.swift
//  1st Project - New To Do List - Andrew Moskowitz
//
//  Created by Andrew Moskowitz on 11/15/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import Foundation

var lists = [List]()

class List {
    var toDoListName: String
    var items = [Item]()
    
    init(toDoListName: String) {
        self.toDoListName = toDoListName
    }
}

class Item {
    var itemName: String
    var itemDescription: String
    
    init(itemName: String, itemDescription: String) {
        self.itemName = itemName
        self.itemDescription = itemDescription
    }
}
