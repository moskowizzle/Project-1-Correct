//
//  ListViewController.swift
//  1st Project - New To Do List - Andrew Moskowitz
//
//  Created by Andrew Moskowitz on 11/15/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var listTableView: UITableView!
    
    @IBAction func addListButton(_ sender: UIButton) {
    
        if listNameTextField.text == "" {
            listNameTextField.placeholder = "Please enter a list name"
        } else {
        
        let listTitle = List(toDoListName: listNameTextField.text!)
        
        lists.append(listTitle)
        listNameTextField.placeholder = "Please enter a list name"
        listNameTextField.text = ""
        
        listTableView.reloadData()
        }
    }
    
    var selectedCell: ListTableViewCell?
    var selectedCellIndex: Int?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        
       cell.listLabel.text = lists[indexPath.row].toDoListName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lists.count
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ListTableViewCell
        
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
            
        lists.remove(at: indexPath.row)
        listTableView.reloadData()
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listOfItemsViewController = segue.destination as! ItemViewController
        listOfItemsViewController.selectedIndex = listTableView.indexPathForSelectedRow?.row
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
