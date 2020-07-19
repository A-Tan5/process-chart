//
//  ViewController.swift
//  process chart
//
//  Created by tantsunsin on 2020/7/19.
//  Copyright © 2020 tantsunsin. All rights reserved.
//

import UIKit

class CircularRingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(showCircularRing())
        // Do any additional setup after loading the view.
    }

    func showCircularRing()->UIView{
        //- 先把弧度、半徑、線寬等等都設代數
        let basicDegree = CGFloat.pi/180
        let percentage : CGFloat = CGFloat.random(in: 0...100)
        
        let startAngle: CGFloat = 270 * basicDegree
        let endAngle: CGFloat = startAngle + ( percentage / 100 * 360 * basicDegree )

        let Radius: CGFloat = 100
        let ArcCenterX: CGFloat = 207
        let ArcCenterY: CGFloat = 368
        
        //基本環
        let circularRingPath = UIBezierPath(ovalIn: CGRect(x: ArcCenterX - Radius, y: ArcCenterY - Radius, width: Radius * 2, height: Radius * 2 ))
        let circularRingLayer = CAShapeLayer()
        circularRingLayer.path = circularRingPath.cgPath
        
        // 百分比部分
        let percentageRingPath = UIBezierPath(arcCenter: CGPoint(x: ArcCenterX, y: ArcCenterY), radius: Radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let percentageRingLayer = CAShapeLayer()
        percentageRingLayer.path = percentageRingPath.cgPath
        
        //基本環跟百分比的呈現
        circularRingLayer.lineWidth = 10
        circularRingLayer.fillColor = UIColor.clear.cgColor
        circularRingLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.25)
        percentageRingLayer.lineWidth = 10
        percentageRingLayer.fillColor = UIColor.clear.cgColor
        percentageRingLayer.strokeColor = CGColor(srgbRed: 150/255, green: 0, blue: 1, alpha: 255)
        
        //label
        let Label = UILabel(frame: CGRect(x: 0, y: 0, width: 2*ArcCenterX, height: 2*ArcCenterY))
        //label中文字的排版:置中
        Label.textAlignment = .center
        //把percentage四捨五入到小數點第二位
        Label.text = "\(round(percentage*100)/100)%"
        
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.addSublayer(circularRingLayer)
        view.layer.addSublayer(percentageRingLayer)
        
        //UILabel是一種UIView，所以要用addSubview
        view.addSubview(Label)
        return view
        
    }

}

