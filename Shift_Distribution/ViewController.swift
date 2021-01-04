//
//  ViewController.swift
//  Shift_Distribution
//
//  Created by Nick on 04.01.2021.
//

import UIKit


//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b, a: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}

class ViewController: UIViewController {
    var people: [String] = ["Кириллова", "Ленева", "Соколова", "Солодовник", "Сергушева", "Осипова", "Ширабайкина"]
    
    @IBOutlet var distrLbl: UILabel!
    
    @IBOutlet var MornLbl: UILabel!
    @IBOutlet var EvenLbl: UILabel!
    @IBOutlet var MondLbl: UILabel!
    @IBOutlet var TueLbl: UILabel!
    @IBOutlet var WendLbl: UILabel!
    @IBOutlet var ThuLbl: UILabel!
    @IBOutlet var FriLbl: UILabel!
    @IBOutlet var SatLbl: UILabel!
    
    @IBOutlet var FirstLbl: UILabel!
    @IBOutlet var SecondLbl: UILabel!
    @IBOutlet var ThirdLbl: UILabel!
    @IBOutlet var FourthLbl: UILabel!
    @IBOutlet var FifthLbl: UILabel!
    @IBOutlet var SixthLbl: UILabel!
    @IBOutlet var SeventhLbl: UILabel!
    @IBOutlet var EightsLbl: UILabel!
    @IBOutlet var NinthLbl: UILabel!
    @IBOutlet var TenthLbl: UILabel!
    @IBOutlet var EleventhLbl: UILabel!
    var cellArr: [UILabel]!
    @IBOutlet var whiteView: UIView!
    
    @IBOutlet var designView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellArr = [FirstLbl, SecondLbl, ThirdLbl, FourthLbl, FifthLbl, SixthLbl, SeventhLbl, EightsLbl, NinthLbl, TenthLbl, EleventhLbl]

        
        for subview in self.view.subviews as! [UIView] {

            if let label = subview as? UILabel {
               label.layer.borderColor = UIColor.black.cgColor
                label.layer.borderWidth = 0.5
                label.layer.cornerRadius = 4
            }

        }
        view.sendSubviewToBack(designView)
        designView.transform = CGAffineTransform(rotationAngle: 45)
        designView.backgroundColor = .lightGray
        title = "Shift Distribution"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPersonAC))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(distribute))
    }

    @objc func addPersonAC() {
        let ac = UIAlertController(title: "Add People to Distribute", message: "Write second names through a space", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.people = answer.split(separator: " ").map(String.init)
            print(self?.people)
        })
        present(ac, animated: true)
        
    }

    @objc func distribute() {
        var tmpPeople = people
          
        FirstLbl.text = "Рыжова"
        FirstLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FirstLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FirstLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FirstLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FirstLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        

        SecondLbl.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        SecondLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        tmpPeople = people.shuffled()

        ThirdLbl.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        ThirdLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        ThirdLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        ThirdLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        ThirdLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        ThirdLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        FourthLbl.text = "Рыжова"
        FourthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        
        tmpPeople = people.shuffled()

        FifthLbl.text = "Рыжова"
        FifthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FifthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FifthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FifthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        FifthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        
        SixthLbl.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        SixthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        tmpPeople = people.shuffled()

        SeventhLbl.text? = tmpPeople[0]
        tmpPeople.remove(at: 0)
        SeventhLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        SeventhLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        SeventhLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        SeventhLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        SeventhLbl.text? += "\n" + tmpPeople[0]

        EightsLbl.text = "Рыжова"
        EightsLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        
        tmpPeople = people.shuffled()

        NinthLbl.text = "Рыжова"
        NinthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        NinthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        NinthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        NinthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        NinthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        TenthLbl.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        TenthLbl.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        people.shuffle()
        EleventhLbl.text = people[0]
    }
    
    
}

