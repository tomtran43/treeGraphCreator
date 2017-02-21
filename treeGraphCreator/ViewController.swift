//
//  ViewController.swift
//  treeGraphCreator
//
//  Created by Loc Tran on 2/21/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var sampleTextField: TF!
    var arrow: LineAndArrow!
    var line: LineAndArrow!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionCreateTextField(_ sender: UIButton) {
        sampleTextField = TF(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
        sampleTextField.textAlignment = .center
        view.addSubview(sampleTextField)
        
    }
    
    
    @IBAction func actionAddArrow(_ sender: UIButton) {
        arrow = LineAndArrow(image: UIImage(named: "arrow.png"))
        arrow.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        view.addSubview(arrow)
        
    }
    
    
    @IBAction func actionAddLine(_ sender: UIButton) {
        line = LineAndArrow(image: UIImage(named: "straight line.png"))
        line.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        view.addSubview(line)
    }

}

