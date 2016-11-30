//
//  ItemViewController.swift
//  1st Project - New To Do List - Andrew Moskowitz
//
//  Created by Andrew Moskowitz on 11/15/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemDescTextField: UITextField!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemListTableView: UITableView!
    
    var selectedIndex: Int?
    var selectedCell: ItemTableViewCell?
    var selectedCellIndex: Int?
   
    @IBAction func addItemButton(_ sender: UIButton) {
        
        if itemNameTextField.text == "" {
            itemNameTextField.placeholder = "Please enter an item"
            itemDescTextField.placeholder = ""
        } else {
            
            let newItem = Item(itemName: itemNameTextField.text!, itemDescription: itemDescTextField.text!)
            
            lists[selectedIndex!].items.append(newItem)
            itemDescTextField.text = ""
            itemNameTextField.text = ""
            itemNameTextField.placeholder = "Add Item"
            
            itemListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[selectedIndex!].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        cell.itemNameLabel.text = lists[selectedIndex!].items[indexPath.row].itemName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ItemTableViewCell
        
        if cell === selectedCell {
            cell.backgroundColor = UIColor.white
            selectedCell = nil
            selectedCellIndex = nil
        }
        else {
            cell.backgroundColor = UIColor.lightGray
            selectedCell?.backgroundColor = UIColor.white
            selectedCell = cell
            selectedCellIndex = indexPath.item
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            lists[selectedIndex!].items.remove(at: indexPath.row)
            itemListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameLabel.text = lists[selectedIndex!].toDoListName
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func doubleTapped() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listOfItemsViewController = segue.destination as! DetailViewController
        listOfItemsViewController.selectedIndex = selectedIndex
        listOfItemsViewController.selectedItemIndex = itemListTableView.indexPathForSelectedRow?.row
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
