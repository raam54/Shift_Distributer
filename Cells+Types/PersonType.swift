//
//  PersonType.swift
//  Shift_Distribution
//
//  Created by Nick on 07.07.2021.
//

import Foundation
import UIKit

struct Person: Codable {
    var photo: Data
    var name: String
    var phone: String
    var shift: [String: String]
    
    init(photo: Data, name: String, phone: String) {
        self.photo = photo
        self.name = name
        self.phone = phone
        self.shift = ["Monday": "First"]
    }
}
