//
//  AddToDoViewController.swift
//  toDoList
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableTableViewController()
    
    //this code below connects the user input box to the code
    //the actions below take in user inputs
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //buttons usually have a function created since they have a direct action
    @IBAction func addTapped(_ sender: Any) {
        let toDo = ToDo()
        
        //we are checking if there is text in the text box, and we are assigning it to the object properties of toDo which we created before
        //the if statement below makes sure that the computer reads the text box (hence the "let")
        if let titleText = titleTextField.text{
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
        //adding user inputs to the actual list
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
