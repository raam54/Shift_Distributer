//
//  CollectionViewController.swift
//  Shift_Distribution
//
//  Created by Nick on 05.01.2021.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var people: [String] = ["Кириллова", "Ленева", "Соколова", "Солодовник", "Сергушева", "Осипова", "Ширабайкина"]
    var cells = [WeekCell]()
    var SatLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        
        title = "Shift Distribution"
        UINavigationBarAppearance().shadowColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPersonAC))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(distribute))
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 118, height: 200)
        }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeekCell", for: indexPath) as! WeekCell
        cell.layer.cornerRadius = 10
//        cell.label.layer.cornerRadius = 10
        switch(indexPath.row){
            case 0: cell.label.text = "Понедельник"
            case 3: cell.label.text = "Вторник"
            case 6: cell.label.text = "Среда"
            case 9: cell.label.text = "Четверг"
            case 12: cell.label.text = "Пятница"
            default: cells.append(cell)
        }
        cell.label.backgroundColor = hexStringToUIColor(hex: "#3d405b")
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionFooter) {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath) as! FooterCell
            footerView.SatLbl.backgroundColor = hexStringToUIColor(hex: "#3d405b")
            footerView.SatLbl.layer.cornerRadius = 10
            footerView.SatLbl.layer.masksToBounds = true
//            footerView.SatLbl.layer.borderColor = UIColor.white.cgColor
            footerView.SatLbl.layer.borderWidth = 1
//            footerView.SatWorkLbl.layer.borderColor = UIColor.white.cgColor
            footerView.SatWorkLbl.backgroundColor = hexStringToUIColor(hex: "#3d405b")
            footerView.SatWorkLbl.layer.borderWidth = 1
            footerView.SatWorkLbl.layer.cornerRadius = 10
            footerView.SatWorkLbl.layer.masksToBounds = true
            SatLbl = footerView.SatWorkLbl

            return footerView
        } else if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! HeaderCell
            
            headerView.infoLbl.layer.cornerRadius = 10
            headerView.infoLbl.backgroundColor = hexStringToUIColor(hex: "#3d405b")
            headerView.infoLbl.layer.borderWidth = 1
            headerView.infoLbl.layer.masksToBounds = true
//            headerView.infoLbl.layer.borderColor = UIColor.white.cgColor
            headerView.MornLbl.layer.borderWidth = 1
            headerView.MornLbl.backgroundColor = hexStringToUIColor(hex: "#3d405b")
            headerView.MornLbl.layer.cornerRadius = 10
            headerView.MornLbl.layer.masksToBounds = true
//            headerView.MornLbl.layer.borderColor = UIColor.white.cgColor
            headerView.EvenLbl.layer.borderWidth = 1
            headerView.EvenLbl.backgroundColor = hexStringToUIColor(hex: "#3d405b")
            headerView.EvenLbl.layer.cornerRadius = 10
            headerView.EvenLbl.layer.masksToBounds = true
//            headerView.EvenLbl.layer.borderColor = UIColor.white.cgColor

            
            return headerView
        }
        fatalError()
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
        
        // вложенные for
        var tmpPeople = people
        cells[0].label.text = "Рыжова"
        cells[0].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[0].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[0].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[0].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[0].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)


        cells[1].label.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[1].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        tmpPeople = people.shuffled()

        cells[2].label.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[2].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[2].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[2].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[2].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[2].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        cells[3].label.text = "Рыжова"
        cells[3].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        tmpPeople = people.shuffled()

        cells[4].label.text = "Рыжова"
        cells[4].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[4].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[4].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[4].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[4].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        cells[5].label.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[5].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        tmpPeople = people.shuffled()

        cells[6].label.text? = tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[6].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[6].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[6].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[6].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[6].label.text? += "\n" + tmpPeople[0]

        cells[7].label.text = "Рыжова"
        cells[7].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        tmpPeople = people.shuffled()

        cells[8].label.text = "Рыжова"
        cells[8].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[8].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[8].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[8].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[8].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        cells[9].label.text = tmpPeople[0]
        tmpPeople.remove(at: 0)
        cells[9].label.text? += "\n" + tmpPeople[0]
        tmpPeople.remove(at: 0)

        people.shuffle()
        SatLbl.text = people[0]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ac = UIAlertController(title: "Change name", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Submit", style: .default) { [weak ac, weak self] action in
            guard let name = ac?.textFields?[0].text else { return }
            if indexPath.row > 0 && indexPath.row < 3 {
                self?.cells[indexPath.row - 1].label.text = name
            }
            if indexPath.row > 2 && indexPath.row < 6 {
                self?.cells[indexPath.row - 2].label.text = name
            }
            if indexPath.row > 5 && indexPath.row < 9 {
                self?.cells[indexPath.row - 3].label.text = name
            }
            if indexPath.row > 8 && indexPath.row < 12 {
                self?.cells[indexPath.row - 4].label.text = name
            }
            if indexPath.row > 11 && indexPath.row < 15 {
                self?.cells[indexPath.row - 5].label.text = name
            }
            
        })
        //print(indexPath.row)
        present(ac, animated: true)
        
        

    }

    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}
