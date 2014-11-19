//
//  ViewController.swift
//  TaskIt
//
//  Created by Son  Luu on 11/12/14.
//  Copyright (c) 2014 Clispo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let date3 = Date.from(year: 2014, month: 12, day: 13)
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2)
        
        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: date3)]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            println(self.tableView.indexPathForSelectedRow())
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taskArray[indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        return cell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
    
}

