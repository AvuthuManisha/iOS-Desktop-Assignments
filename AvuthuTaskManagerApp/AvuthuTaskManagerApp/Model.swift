//
//  Model.swift
//  AvuthuTaskManagerApp
//
//  Created by Avuthu,Manisha on 4/22/23.
//

import Foundation

struct TaskList{
    var items:[String]
}

struct PendingTasks{
    static var tasks = TaskList(items: [])
}

struct CompletedTasks{
    static var tasks = TaskList(items: [])
}

struct CanceledTasks{
    static var tasks = TaskList(items: [])
}
