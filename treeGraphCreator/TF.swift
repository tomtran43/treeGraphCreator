//
//  TF.swift
//  treeGraphCreator
//
//  Created by Loc Tran on 2/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class TF: UITextField, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        createBorder()
        setup()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        createBorder()
        setup()
    }

    
    func setup(){
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
    
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan(panGesture:)))
        self.addGestureRecognizer(panGesture)
    
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto(pinchGestureRecognizer:)))
        self.addGestureRecognizer(pinchGesture)
    
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateItem(rotateGestureRecognizer:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func onPan(panGesture: UIPanGestureRecognizer){
        if (panGesture.state == .began ||
            panGesture.state == .changed){
            
            let point = panGesture.location(in: self.superview)
            self.center = point
            
        }
    }
    
    func pinchPhoto(pinchGestureRecognizer: UIPinchGestureRecognizer){
        if let view = pinchGestureRecognizer.view{
            view.transform = view.transform.scaledBy(x: pinchGestureRecognizer.scale, y: pinchGestureRecognizer.scale)
            pinchGestureRecognizer.scale = 1
        }
    }
    
    func rotateItem(rotateGestureRecognizer: UIRotationGestureRecognizer){
        if let view = rotateGestureRecognizer.view{
            view.transform = view.transform.rotated(by: rotateGestureRecognizer.rotation)
            rotateGestureRecognizer.rotation = 0
        }
    }
    
    func createBorder(){
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red: 55/255, green: 78/255, blue: 95/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("focused")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("lost focus")
    }
    
    
}
