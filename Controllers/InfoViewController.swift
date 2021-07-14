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
        self.photo.image = person.photo
        self.name.text = person.name
        self.phone.text = person.phone
        
        let backButton = UIBarButtonItem(title: "< back", style: .done, target: self, action: #selector(popVC(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func popVC(sender: UIBarButtonItem) {
       navigationController?.popViewController(animated: true)
    }

}
