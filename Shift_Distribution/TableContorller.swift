//
//  TableContorller.swift
//  Shift_Distribution
//
//  Created by Nick on 11.02.2021.
//

import UIKit

protocol CommunicationProtocol: class {
    func refreshData(person: String, image: UIImage)
}

class TableContorller: UITableViewController {
    
    var people = ["Serega", "Nikita", "Anton"]
    var pictures = [String]() // photos of people
    var selectedIndex : NSInteger! = -1 //Delecre this global
    var currentImage: UIImage!
    var profile = [String: UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImages()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("kaloda")
        self.tableView.reloadData()
    }
    
    
    func fetchImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        pictures = items.filter{$0.hasSuffix("jpg")}

            print(pictures)
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkerCell", for: indexPath) as! PersonCell
        let person = people[indexPath.row]
        //This will change with corners of image and height/2 will make this circle shape
        cell.personImage.layer.borderWidth = 1
        cell.personImage.layer.masksToBounds = false
        cell.personImage.layer.borderColor = UIColor.black.cgColor
        cell.personImage.layer.cornerRadius = cell.personImage.frame.height/2
        cell.personImage.clipsToBounds = true
        // ---
        cell.name.text = person
        print(indexPath.row)
        switch(indexPath.row) {
        case 0: cell.personImage.image = UIImage(named: pictures[0])
            case 1: cell.personImage.image = UIImage(named: pictures[0])
            case 2: cell.personImage.image = UIImage(named: pictures[0])
        default: cell.personImage.image = profile[person]
        }
        print(profile ?? "kaloda")
        return cell
    }
    
// Maybe not this way
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.tableView.indexPathForSelectedRow?.row == indexPath.row {
            return 300;
        } else {
        return 200;
        }
    }
    

    
    @objc func addPerson() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Profile") as? ProfileViewController {
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension TableContorller: CommunicationProtocol {
    func refreshData(person: String, image: UIImage) {
        self.tableView.reloadData()
        people.append(person)
        profile[person] = image
        //print(pictures)
    }
}
