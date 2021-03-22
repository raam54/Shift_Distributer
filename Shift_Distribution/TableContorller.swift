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
    var pictures = [UIImage]()
    var selectedIndex : NSInteger! = -1 //Delecre this global
    var currentImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchImages()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("kaloda")
        self.tableView.reloadData()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
        
    }
    
//    func fetchImages() {
//            let fm = FileManager.default
//            let path = Bundle.main.resourcePath!
//            let items = try! fm.contentsOfDirectory(atPath: path)
//
//            for item in items {
//                pictures.append(item)
//                }
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
        let person = people[indexPath.row]

        cell.personImage.layer.borderWidth = 1
        cell.personImage.layer.masksToBounds = false
        cell.personImage.layer.borderColor = UIColor.black.cgColor
        cell.personImage.layer.cornerRadius = cell.personImage.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        cell.personImage.clipsToBounds = true
        cell.name.text = person
        if pictures.count > 0 {  cell.personImage = UIImageView(image: pictures[0])
            print("kaloda")
        }
        print(people)
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
    
   
    
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
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
        pictures.append(image)
        people.append(person)
        print(pictures)
    }
}
