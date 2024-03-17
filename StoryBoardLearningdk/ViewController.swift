//
//  ViewController.swift
//  StoryBoardLearningdk
//
//  Created by Daniel Kimani on 16/03/2024.
//

import UIKit

/*
 echo "# Task-TODO--StoryBoard" >> README.md
 git init
 git add .
 git commit -m "first commit"
 git branch -M main
 git remote add origin https://github.com/danmigwi24/Task-TODO--StoryBoard.git
 git push -u origin main
 
 git add .
 git commit -m "first commit"
 git push
 */

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        //
        tableView.delegate = self
        tableView.dataSource = self
        //
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true,forKey: "setup")
            UserDefaults().set(0,forKey: "count")
        }
        
        //
        updateTask()
    }
    
    func updateTask(){
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {return}
        
        for index in 0..<count{
            guard let task =  UserDefaults().value(forKey: "task_\(index+1)") as? String else {return}
            self.tasks.append(task)
        }
        
        tableView.reloadData()
    }


    @IBAction func didTapAdd(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTask()
            }
           
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
}
