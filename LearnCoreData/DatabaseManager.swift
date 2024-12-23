//
//  DatabaseManager.swift
//  LearnCoreData
//
//  Created by Abhay Chaurasia on 17/05/24.
//

import Foundation
import CoreData
import UIKit
class DatabaseManager {
    static var  shared = DatabaseManager()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveData( object : [String : String])
    {
        print(context ?? "")
        if let context = context {
            let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
            
            student.address = object["address"]
            student.city = object["city"]
            student.name = object["name"]
            student.number = object["number"]
            do {
                try context.save()
                print(student)
            }
            catch {
                debugPrint("data is not save  error occure !")
            }
            
        }
        else {
            print("Something went wrong")
        }
        
    }
    func getStudentData() -> [Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student = try context?.fetch(fetchRequest) as! [Student]
            
        }catch {
            print("can not get data")
        }
        return student
    }
    
    func deleteStudent(index : Int) -> [Student] {
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do{
            try? context?.save()
        }
        catch{
            print("")
        }
        return student
    }
    
    func editData(obj : Student  , index : Int)   {
        var student = getStudentData()
        student[index].name = obj.name
        student[index].address = obj.address
        student[index].city = obj.city
        student[index].number = obj.number
        
        do {
            try context?.save()
        }
        catch {
            print("something wrong")
        }
    }
}
