//
//  TableContorller.swift
//  Shift_Distribution
//
//  Created by Nick on 11.02.2021.
//

import UIKit

protocol CommunicationProtocol: AnyObject {
    func refreshData(name: String, image: Data, phone: String)
}

class TableContorller: UITableViewController, CommunicationProtocol {
    var people = [Person]()
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFromUserDefaults()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
    }
    
    func refreshData(name: String, image: Data, phone: String) {
        people.append(Person(photo: image, name: name, phone: phone))
        addToUserDefaults(people)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        cell.personImage.image = UIImage(data: person.photo)!
        cell.infoBtn.tag = indexPath.row
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.row)
            addToUserDefaults(people)
            print(people)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
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
    
    func addToUserDefaults(_ people: [Person]) {
        do {
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(people)
            
            UserDefaults.standard.setValue(data, forKey: "people")
        } catch  {
            print( "Unable to Encode Array of People (\(error))")
        }
    }
    
    func getFromUserDefaults() {
        if let data = userDefaults.data(forKey: "people") {
            do {
                let decoder = JSONDecoder()
                people = try decoder.decode([Person].self, from: data)
            } catch {
                print("Unable to decode from data (\(error))")
            }
        }
    }
    
}


