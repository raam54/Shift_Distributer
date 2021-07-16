//
//  InfoViewController.swift
//  Shift_Distribution
//
//  Created by Nick on 29.04.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    var person: Person!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet var collectionOfSegs: Array<UISegmentedControl>!
    @IBOutlet weak var SatSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for seg in collectionOfSegs {
            seg.isEnabled = false
        }
        SatSwitch.isEnabled = false
        self.photo.image = UIImage(data: person.photo)
        self.name.text = person.name
        self.phone.text = person.phone
        
        let backButton = UIBarButtonItem(title: "< back", style: .done, target: self, action: #selector(popVC(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //showing shifts
        let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        
        for day in days {
            print(person.shift[day]!)
            switch(person.shift[day]!) {
                case "First": collectionOfSegs[days.firstIndex{$0 == day}!].selectedSegmentIndex = 0
                case "Second": collectionOfSegs[days.firstIndex{$0 == day}!].selectedSegmentIndex = 1
                default: print("Fuck")
            }
        }
    }
    
    @objc func popVC(sender: UIBarButtonItem) {
       navigationController?.popViewController(animated: true)
    }
    

}
