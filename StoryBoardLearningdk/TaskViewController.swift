//
//  TaskViewController.swift
//  StoryBoardLearningdk
//
//  Created by Daniel Kimani on 16/03/2024.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var task:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deletTask))
    }
   

    @objc func deletTask(){
        /*
        let newCount = count - 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(nil, forKey: "task_\(currentPosition)")
         */
    }
}
