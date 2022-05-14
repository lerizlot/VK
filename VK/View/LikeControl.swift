//
//  LikeControl.swift
//  VK
//
//  Created by Lera on 14.05.22.
//

import UIKit

@IBDesignable

class LikeControl: UIControl {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        super.draw(rect)
        // вызываем графический контекст, параметры с которыми выполняется рисование
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // вызывается для перерисовки view
        setNeedsDisplay()
        // одна из опций задавать цвет
        let color: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        // Рисование при помощи CGRect
        context.setFillColor(color.cgColor)
        
        let heartView = CGRect(x:rect.width/2,
                               y: rect.height/2,
                               width: rect.height/4,
                               height: rect.width/4)
        context.fill(heartView)
        context.move(to: CGPoint(x: 40, y: 20))
        context.addLine(to: CGPoint(x: 45, y: 40))
        context.addLine(to: CGPoint(x: 65, y: 40))
        context.addLine(to: CGPoint(x: 50, y: 50))
        context.addLine(to: CGPoint(x: 60, y: 70))
        context.addLine(to: CGPoint(x: 40, y: 55))
        context.addLine(to: CGPoint(x: 20, y: 70))
        context.addLine(to: CGPoint(x: 30, y: 50))
        context.addLine(to: CGPoint(x: 15, y: 40))
        context.addLine(to: CGPoint(x: 35, y: 40))
        
        // соединяет последнюю точку с первой
        context.closePath()
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.setStrokeColor(UIColor.yellow.cgColor)
        
        // рисует линии от начальной точки до последней
        context.strokePath()
        
        // Рисование кривыми Бизье
        //        let path = UIBezierPath()
        //        path.move(to: CGPoint(x: 40, y: 20))
        //        path.addLine(to: CGPoint(x: 45, y: 40))
        //        path.addLine(to: CGPoint(x: 65, y: 40))
        //        path.addLine(to: CGPoint(x: 50, y: 50))
        //        path.addLine(to: CGPoint(x: 60, y: 70))
        //        path.addLine(to: CGPoint(x: 40, y: 55))
        //        path.addLine(to: CGPoint(x: 20, y: 70))
        //        path.addLine(to: CGPoint(x: 30, y: 50))
        //        path.addLine(to: CGPoint(x: 15, y: 40))
        //        path.addLine(to: CGPoint(x: 35, y: 40))
        //        path.close()
        //        path.stroke()
        //
        //
        //        context.addPath(path.cgPath)
        //        context.fillPath()
        
        // методы с урока
        
        //let colorTwo: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
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
        
        let myPath = UIBezierPath()
        
        myPath.move(to: CGPoint(x: 20, y: 10))
        myPath.addLine(to: CGPoint(x: 22, y: 20))
        myPath.addLine(to: CGPoint(x: 32, y: 20))
        myPath.addLine(to: CGPoint(x: 25, y: 25))
        myPath.addLine(to: CGPoint(x: 30, y: 35))
        myPath.addLine(to: CGPoint(x: 20, y: 27))
        myPath.addLine(to: CGPoint(x: 10, y: 35))
        myPath.addLine(to: CGPoint(x: 15, y: 25))
        myPath.addLine(to: CGPoint(x: 7, y: 20))
        myPath.addLine(to: CGPoint(x: 17, y: 20))
        myPath.close()
        myPath.stroke()
        
        context.addPath(myPath.cgPath)
        context.fillPath()
        
    }
    
    
    
}
