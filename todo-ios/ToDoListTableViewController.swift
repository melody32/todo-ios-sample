//
//  ToDoListTableViewController.swift
//  todo-ios
//
//  Created by lenstr on 14/12/14.
//  Copyright (c) 2014 lenstr.inc. All rights reserved.
//

import Foundation;
import UIKit

class ToDoListTableViewController: UITableViewController {

    var toDoItems: [ToDoItem] = []

    func loadInitialData() {
        toDoItems.extend([
            ToDoItem(itemName: "o-O"),
            ToDoItem(itemName: "1"),
            ToDoItem(itemName: "2"),
        ]);
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        toDoItems = [];
        loadInitialData();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem();
        self.tableView.allowsMultipleSelectionDuringEditing = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction
    func unwindToList(segue: UIStoryboardSegue, sender: NSObject?) {
        NSLog("[unwindToList] segue: %@, sender: %@", segue, sender!);

        let source = segue.sourceViewController as? AddToDoItemViewController;
        if let item = source?.todoItem {
            toDoItems.append(item);
        }

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return toDoItems.count;
    }

    override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = toDoItems[indexPath.row];

        let cell = tableView.dequeueReusableCellWithIdentifier("protoCell", forIndexPath: indexPath) as UITableViewCell;

        cell.textLabel?.text = item.itemName;

        if item.completed {
            cell.accessoryType = .Checkmark;
            cell.detailTextLabel?.text = item.completionDate?.description;
        } else {
            cell.accessoryType = .None;
            cell.detailTextLabel?.text = item.creationDate.description;
        }

        return cell;
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("didSelect %d", indexPath.row);

        tableView.deselectRowAtIndexPath(indexPath, animated: false);

        var tappedItem = toDoItems[indexPath.row];
        tappedItem.completed = !tappedItem.completed;

        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None);
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        switch editingStyle {
        case .Delete:
            toDoItems.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .Insert:
            break;
        case .None:
            break;
        }
    }

//    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
//
//        var moreRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "More", handler:{action, indexpath in
//            println("MORE•ACTION");
//        });
//        moreRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0);
//
////        var deleteRowAction = UITableViewRowAction(style: .Default, title: "Delete",
////            handler: { (action: UITableViewRowAction!, indexPath: NSIndexPath!) in
////                println("o-O");
////        });
////
//        var deleteRowAction = UITableViewRowAction(style: .Default, title: "Delete", handler: handleCustomAction);
//
//        return [deleteRowAction, moreRowAction];
//    }

    func handleCustomAction(action: UITableViewRowAction!, indexPath: NSIndexPath!) {
        println("handleCustomAction");
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
