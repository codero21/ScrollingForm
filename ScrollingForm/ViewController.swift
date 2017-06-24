//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Rollin Francois on 6/22/17.
//  Copyright © 2017 Francois Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var addressField1: UITextField!
    @IBOutlet weak var addressField2: UITextField!
    @IBOutlet weak var postcodeField: UITextField!
    
    
    
    // MARK: Properties
    
    var keyboardHieght: Float = 0.0
    var currentTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

