//
//  LIstVC.swift
//  LearnCoreData
//
//  Created by Abhay Chaurasia on 11/09/24.
//

import UIKit

protocol SelectData {
    func selectData(data  : Student , index : Int , isUpdate : Bool)
}
class LIstVC: UIViewController {
    var delegate : SelectData?
    @IBOutlet weak var listVCtableview: UITableView!
    var student = [Student]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.listVCtableview.dataSource  = self
        self.listVCtableview.delegate = self
        student = DatabaseManager.shared.getStudentData()
    }
    

    

}

extension LIstVC : UITableViewDelegate , UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = self.listVCtableview.dequeueReusableCell(withIdentifier: "LIstVCTableViewCell", for: indexPath) as! LIstVCTableViewCell
        let data = self.student[indexPath.row]
        cell.name.text =  "Name : \(data.name ?? "")"
        cell.citylbl.text =  "City : \(data.city ?? "")"
        cell.addresslbl.text =  "Address : \(data.address ?? "")"
        cell.mobilelbl.text = "Mobile : \(data.number ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            student = DatabaseManager.shared.deleteStudent(index: indexPath.row)
            self.listVCtableview.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         self.delegate?.selectData(data: student[indexPath.row], index: indexPath.row, isUpdate: true)
        self.navigationController?.popViewController(animated: true)
    }
}
