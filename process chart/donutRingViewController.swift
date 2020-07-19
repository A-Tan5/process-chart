//
//  donutRingViewController.swift
//  process chart
//
//  Created by tantsunsin on 2020/7/19.
//  Copyright © 2020 tantsunsin. All rights reserved.
//

import UIKit

class donutRingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(showDonutRing())

        // Do any additional setup after loading the view.
    }
    
    func showDonutRing() -> UIView {
        let basicDegree = CGFloat.pi/180
        let percentage1 : CGFloat = CGFloat.random(in: 20...40)
        let percentage2 : CGFloat = CGFloat.random(in: 20...40)
        let percentage3 : CGFloat = 100 - percentage1 - percentage2
        
        let Radius: CGFloat = 100
        let ArcCenterX : CGFloat = 207
        let ArcCenterY : CGFloat = 368
        
        //第一段
        let firstPath = UIBezierPath(arcCenter: CGPoint(x: ArcCenterX, y: ArcCenterY), radius: Radius, startAngle: 270*basicDegree, endAngle: (270+(percentage1/100*360))*basicDegree, clockwise: true)
        
        let firstLayer = CAShapeLayer()
        firstLayer.path = firstPath.cgPath
        firstLayer.lineWidth = 40
        firstLayer.fillColor = UIColor.clear.cgColor
        firstLayer.strokeColor = CGColor(srgbRed: CGFloat.random(in: 0.2...0.5), green: CGFloat.random(in: 0.5...1), blue: CGFloat.random(in: 0.2...0.5), alpha: 255)
    
        
        //第二段
        let secondPath = UIBezierPath(arcCenter: CGPoint(x: ArcCenterX, y: ArcCenterY), radius: Radius, startAngle: (270+(percentage1/100*360))*basicDegree, endAngle: (270+((percentage1+percentage2)/100*360))*basicDegree, clockwise: true)
        
        let secondLayer = CAShapeLayer()
        secondLayer.path = secondPath.cgPath
        secondLayer.lineWidth = 40
        secondLayer.fillColor = UIColor.clear.cgColor
        secondLayer.strokeColor = CGColor(srgbRed: CGFloat.random(in: 0.2...0.5), green: CGFloat.random(in: 0.2...0.5), blue: CGFloat.random(in: 0.5...1), alpha: 255)
        
        //第三段
        let thirdPath = UIBezierPath(arcCenter: CGPoint(x: ArcCenterX, y: ArcCenterY), radius: Radius, startAngle: (270-(percentage3 / 100*360))*basicDegree, endAngle:270*basicDegree, clockwise: true)
        
        let thirdLayer = CAShapeLayer()
        thirdLayer.path = thirdPath.cgPath
        thirdLayer.lineWidth = 40
        thirdLayer.fillColor = UIColor.clear.cgColor
        thirdLayer.strokeColor = CGColor(srgbRed: CGFloat.random(in: 0.5...1), green: CGFloat.random(in: 0.2...0.5), blue: CGFloat.random(in: 0.2...0.5), alpha: 255)
        
        
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.addSublayer(firstLayer)
        view.layer.addSublayer(secondLayer)
        view.layer.addSublayer(thirdLayer)
        return view
    }

}
