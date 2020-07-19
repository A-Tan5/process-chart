//
//  PieChartViewController.swift
//  process chart
//
//  Created by tantsunsin on 2020/7/19.
//  Copyright © 2020 tantsunsin. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(showPieChart())

        // Do any additional setup after loading the view.
    }
    
    let Radius: CGFloat = 100
    let ArcCenterX : CGFloat = 207
    let ArcCenterY : CGFloat = 368
    
    func PieChartPath (startDegree : CGFloat, endDegree: CGFloat)->CAShapeLayer{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: ArcCenterX, y: ArcCenterY))
        path.addArc(withCenter: CGPoint(x: ArcCenterX, y: ArcCenterY), radius: Radius, startAngle: startDegree, endAngle: endDegree, clockwise: true)
  
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = CGColor(srgbRed: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.9...1))
        
        return layer
    }
    
    
    func showPieChart()->UIView{
        let basicDegree = CGFloat.pi/180
         let percentage1 : CGFloat = CGFloat.random(in: 20...40)
         let percentage2 : CGFloat = CGFloat.random(in: 20...40)
         let percentage3 : CGFloat = 100 - percentage1 - percentage2
        
        let firstLayer = PieChartPath(startDegree: 270*basicDegree, endDegree: (270+(percentage1/100*360))*basicDegree)
        
        let secondLayer = PieChartPath(startDegree: (270+(percentage1/100*360))*basicDegree, endDegree: (270-(percentage3/100*360))*basicDegree)
        
        let thirdLayer = PieChartPath(startDegree: (270-(percentage3/100*360))*basicDegree, endDegree: 270*basicDegree)

        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.addSublayer(firstLayer)
        view.layer.addSublayer(secondLayer)
        view.layer.addSublayer(thirdLayer)
        return view
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
