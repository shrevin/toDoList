//
//  ToDoTableTableViewController.swift
//  toDoList
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    //initializing a variable referencing the ToDo file
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        toDos = createToDos()
    }

  //the function below refers to the ToDo function
    func createToDos() -> [ToDo] {
        
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        // important is set to false by default
        
        return [swift, dog]
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    // MARK: - Table view data source

//        func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        //calliong toDos (variable using class ToDo) to input todo list by row in table
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        }
            
        else   {
            cell.textLabel?.text = toDo.name
        }
        
        
        return cell
    }
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        //we are coding in a segue below
        if let addVC = segue.destination as? AddToDoViewController{
            addVC.previousVC = self

        }
        if let completeVC = segue.destination as? CompleteToDoViewController{
            if let toDo = sender as? ToDo {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
                
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: "toDo")
    }
    
    }


