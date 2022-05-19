//
//  Friends.swift
//  VK
//
//  Created by Lera on 13.05.22.
//

import Foundation
import UIKit

class Friends {
    
    let image: UIImage?
    let name: String
    
    init(friendImage: UIImage? = nil, friendName: String) {
        self.image = friendImage
        self.name = friendName
    }
}
