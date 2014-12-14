//
//  AddToDoItemViewController.swift
//  todo-ios
//
//  Created by lenstr on 14/12/14.
//  Copyright (c) 2014 lenstr.inc. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBAction func onDone(sender: UIBarButtonItem) {
        NSLog("onDone");
    }

    private(set) var todoItem: ToDoItem?;

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        view.endEditing(true);
        if doneButton === sender && !textField.text.isEmpty {
            todoItem = ToDoItem(itemName: textField.text);
        }

    }
}
