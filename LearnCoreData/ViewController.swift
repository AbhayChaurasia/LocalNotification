//
//  ViewController.swift
//  LearnCoreData
//
//  Created by Abhay Chaurasia on 10/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nametxt : UITextField!
    @IBOutlet weak var mobilenumtxt : UITextField!
    @IBOutlet weak var  addresstxt : UITextField!
    @IBOutlet weak var  citytxt : UITextField!
     var i = Int()
    var isUpdate = Bool()
    var studentdata = Student()
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    @IBAction func tapOnListBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LIstVC") as! LIstVC
        vc.delegate = self 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapOnSubmitBtn(_ sender: Any) {
        
        if isUpdate {
            DatabaseManager.shared.editData(obj: studentdata, index: i)
        }
        else {
            let dict = [
                        "address" : self.addresstxt.text ?? "" ,
                        "city"    : self.citytxt.text ?? "" ,
                        "name"    : self.nametxt.text ?? "" ,
                        "number"  : self.mobilenumtxt.text ?? ""
                       ]
            
            print(dict)
            DatabaseManager.shared.saveData(object: dict)
            
        }
      
        
        
    }
}

extension ViewController : SelectData {
    func selectData(data: Student, index: Int, isUpdate: Bool) {
        self.addresstxt.text  = data.address
        self.citytxt.text    = data.city
        self.nametxt.text  = data.name
        self.mobilenumtxt.text  = data.number
        i = index
        self.studentdata = data
        self.isUpdate = isUpdate

    }
    
    func selectData(data: Student) {
            }
    
    
    
    
}
