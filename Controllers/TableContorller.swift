//
//  TableContorller.swift
//  Shift_Distribution
//
//  Created by Nick on 11.02.2021.
//

import UIKit

protocol CommunicationProtocol: class {
    func refreshData(name: String, image: UIImage, phone: String)
}

class TableContorller: UITableViewController, CommunicationProtocol {
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchImages()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
    }
    
    func refreshData(name: String, image: UIImage, phone: String) {
        people.append(Person(photo: image, name: name, phone: phone))
        self.tableView.reloadData()
        //print(pictures)
    }
    
    
//    func fetchImages() {
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//        pictures = items.filter{$0.hasSuffix("jpg")}
//
//            print(pictures)
//            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
//        }
    

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
        //This will change with corners of image and height/2 will make this circle shape
        cell.personImage.layer.borderWidth = 1
        cell.personImage.layer.masksToBounds = false
        cell.personImage.layer.borderColor = UIColor.black.cgColor
        cell.personImage.layer.cornerRadius = cell.personImage.frame.height/2
        cell.personImage.clipsToBounds = true
        // ---
        // Configuring the cell
        let person = people[indexPath.row]
        cell.name.text = person.name
        cell.personImage.image = person.photo
        cell.infoBtn.tag = indexPath.row
        return cell
    }
    
// Maybe not this way
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            self.tableView.beginUpdates()
//            self.tableView.endUpdates()
//        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    
    @objc func addPerson() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Profile") as? ProfileViewController {
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func openInfo(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Info") as? InfoViewController {
            vc.person = people[(sender as! UIButton).tag]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


