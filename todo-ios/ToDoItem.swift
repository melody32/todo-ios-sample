//
//  ToDoItem.swift
//  todo-ios
//
//  Created by lenstr on 14/12/14.
//  Copyright (c) 2014 lenstr.inc. All rights reserved.
//

import Foundation

class ToDoItem {
    var itemName: String;
    private(set) var creationDate: NSDate;
    private(set) var completionDate: NSDate? = nil;
    private var _completed: Bool;

    init(itemName name: String, completed isCompleted: Bool = false, creationDate cdate: NSDate = NSDate()) {
        itemName = name;
        _completed = isCompleted;
        creationDate = cdate;
        if _completed {
            completionDate = creationDate;
        }
    }
    
    var completed: Bool {
        get {
            return _completed;
        }
        set(isCompleted) {
            _completed = isCompleted;
            setCompletionDate();
        }
    }
    
    private func setCompletionDate() {
        if completed {
            completionDate = NSDate();
        } else {
            completionDate = nil;
        }
    }
    
    deinit {
        NSLog("deinit ToDoItem");
    }
}