//
//  DetailViewController.swift
//  1st Project - New To Do List - Andrew Moskowitz
//
//  Created by Andrew Moskowitz on 11/16/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//  Just adding this line as a test
// Another one

import UIKit

class DetailViewController: UIViewController {
    
   // @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var itemNameTextField: UITextField!
    var selectedIndex: Int?
    var selectedItemIndex: Int?
    
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        item = lists[selectedIndex!].items[selectedItemIndex!]
        
        itemNameTextField.text = item.itemName
        detailTextView.text = item.itemDescription
        
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        item.itemName = itemNameTextField.text!
        item.itemDescription = detailTextView.text!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
