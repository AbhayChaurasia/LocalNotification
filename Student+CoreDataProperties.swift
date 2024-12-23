//
//  Student+CoreDataProperties.swift
//  LearnCoreData
//
//  Created by Abhay Chaurasia on 17/05/24.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var number: String?
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?

}

extension Student : Identifiable {

}
