//
//  LineAndArrow.swift
//  treeGraphCreator
//
//  Created by Loc Tran on 2/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class LineAndArrow: UIImageView, UIGestureRecognizerDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    
    required override init(image: UIImage?) {
        super.init(image: image)
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

    
}
