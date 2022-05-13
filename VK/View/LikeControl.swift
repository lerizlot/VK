//
//  LikeControl.swift
//  VK
//
//  Created by Lera on 13.05.22.

import UIKit

@IBDesignable

class LikeControl: UIControl {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code

        super.draw(rect)

        // настройки для рисования
        guard let context = UIGraphicsGetCurrentContext() else {return}

        //let colorOne: CGColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        let color: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        // stroke - рамка, fill - заливка
        context.setFillColor(color.cgColor)
        
        context.saveGState()

        let rectangleRed = CGRect(x: rect.width/2,
                                  y: rect.height/2,
                                  width: rect.height/4,
                                  height: rect.width/4)
        
        context.fill(rectangleRed)
        
        context.move(to: CGPoint(x: rect.width/2, y: 0))
        context.addLine(to: CGPoint(x: rect.width/2, y: rect.height/2))
        context.addLine(to: CGPoint(x: 0, y: rect.height/2))
        //закрывает пространство
        context.closePath()
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.setStrokeColor(UIColor.yellow.cgColor)
        
        context.strokePath()
        
        context.restoreGState()
        
        let triangle = UIBezierPath()
        
        triangle.move(to: CGPoint(x: 0, y: rect.height/2))
        triangle.addLine(to: CGPoint(x: 0, y: rect.height))
        triangle.addLine(to: CGPoint(x: rect.height/2, y: rect.height))
        
        triangle.close()
        
        context.addPath(triangle.cgPath)
        context.fillPath()
    }


}
