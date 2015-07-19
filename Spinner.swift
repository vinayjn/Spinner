//
//  Spinner.swift
//  Search
//
//  Created by Vinay Jain on 7/19/15.
//  Copyright (c) 2015 Vinay Jain. All rights reserved.
//

import UIKit

class Spinner: UIView {
    
    @IBInspectable var innerFillColor : UIColor!
    @IBInspectable var innerStrokeColor : UIColor!
    @IBInspectable var innerLineWidth : NSNumber!
    
    @IBInspectable var outerFillColor : UIColor!
    @IBInspectable var outerStrokeColor : UIColor!
    @IBInspectable var outerLineWidth : NSNumber!
    
    var currentInnerRotation : CGFloat!
    var currentOuterRotation : CGFloat!
    
    var innerView : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        
        currentInnerRotation = 0.0
        currentOuterRotation = 0.0
        
        self.backgroundColor = UIColor.clearColor()
        
        var outerLayer = CAShapeLayer()
        outerLayer.path = UIBezierPath(ovalInRect: rect).CGPath
        outerLayer.lineWidth = CGFloat(outerLineWidth.floatValue)
        outerLayer.strokeStart = 0.0
        outerLayer.strokeEnd = 0.5
        outerLayer.lineCap = kCALineCapRound
        outerLayer.fillColor = outerFillColor.CGColor
        outerLayer.strokeColor = outerStrokeColor.CGColor
        self.layer.addSublayer(outerLayer)
        
        innerView = UIView()
        self.addSubview(innerView)
        innerView.frame = CGRectMake((rect.size.width - (rect.size.width - 20))/2.0 , (rect.size.height - (rect.size.height - 20))/2.0, rect.size.width - 20, rect.size.height - 20)
        var innerLayer = CAShapeLayer()
        innerLayer.path = UIBezierPath(ovalInRect: innerView.bounds).CGPath
        innerLayer.lineWidth = CGFloat(innerLineWidth.floatValue)
        innerLayer.strokeStart = 0.4
        innerLayer.strokeEnd = 1.0
        innerLayer.lineCap = kCALineCapRound
        innerLayer.fillColor = innerFillColor.CGColor
        innerLayer.strokeColor = innerStrokeColor.CGColor
        innerView.layer.addSublayer(innerLayer)
        
        self.animateInner()
        self.animateOuter()
        
    }
    
    func animateInner(){
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveLinear | .OverrideInheritedDuration, animations: { () -> Void in
            self.currentInnerRotation! += CGFloat(M_PI_4)
            self.innerView.transform = CGAffineTransformMakeRotation(-self.currentInnerRotation!);
            }) { (Bool finished) -> Void in
                self.animateInner()
        }
    }
    func animateOuter(){
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveLinear | .OverrideInheritedDuration, animations: { () -> Void in
            self.currentOuterRotation! += CGFloat(M_PI_4)
            self.transform = CGAffineTransformMakeRotation(self.currentOuterRotation!);
            }) { (Bool finished) -> Void in
                self.animateOuter()
        }
    }
}
