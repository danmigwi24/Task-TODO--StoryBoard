//
//  EntryViewController.swift
//  StoryBoardLearningdk
//
//  Created by Daniel Kimani on 16/03/2024.
//

import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var fieldTextField: UITextField!
    
    var update:(()->Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fieldTextField.delegate = self
        //Adding a navigation button programatically
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveText))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveText()
        
        return true
    }
    
   
    
   @objc func saveText(){
       guard let text = fieldTextField.text,!text.isEmpty else {
           return
       }
       
       guard let count = UserDefaults().value(forKey: "count") as? Int else {return}
       
       let newCount = count + 1
       
       UserDefaults().set(newCount,forKey: "count")
       UserDefaults().set(text,forKey: "task_\(newCount)")
       
       
       update?()
       
       navigationController?.popViewController(animated: true)
    }
    

}
