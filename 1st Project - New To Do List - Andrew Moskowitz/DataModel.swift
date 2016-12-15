//
//  DataModel.swift
//  1st Project - New To Do List - Andrew Moskowitz
//
//  Created by Andrew Moskowitz on 11/15/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import Foundation

var lists = [List]()

class List: NSObject, NSCoding {
    
    private struct Keys {
        static let toDoListName = "toDoListName"
        static let items = "items"
    }
    var toDoListName: String
    var items = [Item]()
    
    init(toDoListName: String, items: [Item]) {
        self.toDoListName = toDoListName
        self.items = items
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(
            toDoListName: aDecoder.decodeObject(forKey: Keys.toDoListName) as! String,
            items: aDecoder.decodeObject(forKey: Keys.items) as! [Item]
            )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(toDoListName, forKey: Keys.toDoListName)
        aCoder.encode(items, forKey: Keys.items)
    }
}

class Item: NSObject, NSCoding {
    private struct Keys {
        static let itemName = "itemName"
        static let itemDescription = "itemDescription"
    }
    
    var itemName: String
    var itemDescription: String
    
    init(itemName: String, itemDescription: String) {
        self.itemName = itemName
        self.itemDescription = itemDescription
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(
            itemName: aDecoder.decodeObject(forKey: Keys.itemName) as! String,
            itemDescription: aDecoder.decodeObject(forKey: Keys.itemDescription) as! String
            )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(itemName, forKey: Keys.itemName)
        aCoder.encode(itemDescription, forKey: Keys.itemDescription)
    }
}
