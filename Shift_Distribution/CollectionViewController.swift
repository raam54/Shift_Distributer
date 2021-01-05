//
//  CollectionViewController.swift
//  Shift_Distribution
//
//  Created by Nick on 05.01.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        title = "Shift Distribution"
        collectionView.layoutMargins.top = 10
        
//        headerCell.infoLbl.layer.borderColor = UIColor.black.cgColor
//        headerCell.MornLbl.layer.borderColor = UIColor.black.cgColor
//        headerCell.EvenLbl.layer.borderColor = UIColor.black.cgColor
//        footerCell.SatLbl.layer.borderColor = UIColor.black.cgColor
//        footerCell.SatWorkLbl.layer.borderColor = UIColor.black.cgColor
//        headerCell.infoLbl.layer.borderWidth = 0.5
//        headerCell.MornLbl.layer.borderWidth = 0.5
//        headerCell.EvenLbl.layer.borderWidth = 0.5
//        footerCell.SatLbl.layer.borderWidth = 0.5
//        footerCell.SatWorkLbl.layer.borderWidth = 0.5
    
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeekCell", for: indexPath) as! WeekCell
        cell.label.text = "Пятница"
        cell.label.layer.borderWidth = 0.5
        cell.label.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionFooter) {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath) as! FooterCell
            
            footerView.SatLbl.layer.borderColor = UIColor.black.cgColor
            footerView.SatLbl.layer.borderWidth = 0.5
            footerView.SatWorkLbl.layer.borderColor = UIColor.black.cgColor
            footerView.SatWorkLbl.layer.borderWidth = 0.5

            return footerView
        } else if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! HeaderCell
            
            headerView.infoLbl.layer.borderColor = UIColor.black.cgColor
            headerView.MornLbl.layer.borderWidth = 0.5
            headerView.MornLbl.layer.borderColor = UIColor.black.cgColor
            headerView.EvenLbl.layer.borderWidth = 0.5
            headerView.EvenLbl.layer.borderColor = UIColor.black.cgColor
            headerView.infoLbl.layer.borderWidth = 0.5
            
            
            // Customize headerView here
            return headerView
        }
        fatalError()
    }

}
