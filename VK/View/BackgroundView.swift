//
//  BackgroundView.swift
//  VK
//
//  Created by Lera on 13.05.22.
//

import UIKit

class BackgroundView: UIView {

    var shadowRadius: CGFloat = 20
    var shadowOpacity: Float = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBackgroundView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.width/2
    }
    
    func setBackgroundView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }

}
