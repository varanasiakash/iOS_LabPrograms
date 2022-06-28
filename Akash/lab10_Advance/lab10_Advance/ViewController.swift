//
//  ViewController.swift
//  lab10_Advance
//
//  Created by student on 14/06/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var userName1 : UITextField!
    @IBOutlet var userAddress1 : UITextField!
    @IBOutlet var userPhoneNumber1 : UITextField!
    @IBOutlet var userEmail1 : UITextField!
    
    @IBOutlet var saveData1 : UIButton!
    @IBOutlet var findData1 : UIButton!
    
    @IBOutlet var labelInfo : UILabel!
    
    let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func saveButtonClick()
    {
        let context = appDelegate1.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "PersonalDetails", in: context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(userName1.text, forKey: "name")
        newUser.setValue(userAddress1.text, forKey: "address")
        newUser.setValue(userPhoneNumber1.text, forKey: "phoneNumber")
        newUser.setValue(userEmail1.text, forKey: "email")
        
        do
        {
            try context.save()
            userName1.text = ""
            userAddress1.text = ""
            userPhoneNumber1.text = ""
            userEmail1.text = ""
            
            labelInfo.text = "Contact Saved"
            
            
        }catch
        {
            print("failed saving")
            
            labelInfo.text = "Failed Saving"
        }
    }
    
    @IBAction func findBuuttonClick()
    {
        let context = appDelegate1.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonalDetails")
        
        request.predicate = NSPredicate(format: "name = %@", userName1.text!)
        
        do
        {
            let result = try context.fetch(request)
            
            for data in result as!
                    [NSManagedObject]
            {
                userAddress1.text = data.value(forKey: "address") as? String
                userPhoneNumber1.text = data.value(forKey: "phoneNumber") as? String
                userEmail1.text = data.value(forKey: "email") as? String
                
                labelInfo.text = "Matches found : \(result.count)"
            }
            
        }catch{
            print("failed")
            
            labelInfo.text = "Failed Contact Saved"
        }
    }

}

