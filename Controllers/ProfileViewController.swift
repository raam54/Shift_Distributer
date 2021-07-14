//
//  ProfileViewController.swift
//  Shift_Distribution
//
//  Created by Nick on 06.01.2021.
//

import UIKit


class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    weak var delegate: CommunicationProtocol?
    var imagePicker = UIImagePickerController()
    var currentImage: UIImage!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtn))
        addBtn.backgroundColor = hexStringToUIColor(hex: "#55a630")
        addBtn.layer.cornerRadius = 10
        addBtn.tintColor = .white
        
    }

    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneBtn() {
        guard let nameText = nameField.text else { return }
        guard let phoneText = phoneField.text else { return }
        guard let curImage = currentImage else { return }
        self.delegate?.refreshData(name: nameText, image: curImage, phone: phoneText)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){

                    imagePicker.delegate = self
                    imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = false

                    present(imagePicker, animated: true, completion: nil)
                }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
        
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
    
    
//    @IBAction func addContacts(_ sender: Any) {
//    }
}


