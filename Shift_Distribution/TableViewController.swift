//
//  TableViewController.swift
//  Shift_Distribution
//
//  Created by Nick on 06.01.2021.
//

import UIKit

class TableViewController: UITableViewController{
    
    
    var people: [String] = ["Рыжов Никита", "Букато Артем", "Копылов Антон"]
    var pictures = [String]()
    var tmp: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //overrideUserInterfaceStyle = .dark
        title = "Your Facility"
        self.tableView.delegate = self // invoke data source and delegate on current class
        self.tableView.dataSource = self
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "WorkerCell")
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
//        performSelector(inBackground: #selector(fetchImages), with: nil)
    }
    
//    @objc func fetchImages() {
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        for item in items {
//            pictures.append(item)
//            }
//
//        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
//    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkerCell", for: indexPath) as! PersonCell
        let person = people[indexPath.row]
        cell.name.text = person
        //cell.imageView?.image = UIImage(named: pictures[0])
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    
    
//    @objc func addPerson() {
//
//    }

}
