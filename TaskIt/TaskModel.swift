//
//  TaskModel.swift
//  TaskIt
//
//  Created by Son  Luu on 12/2/14.
//  Copyright (c) 2014 Clispo. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
