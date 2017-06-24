//
//  ViewController.swift
//  ScrollingForm
//
//  Created by Rollin Francois on 6/22/17.
//  Copyright © 2017 Francois Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameField: UILabel!
    @IBOutlet weak var passwordField: UILabel!
    @IBOutlet weak var addressField1: UILabel!
    @IBOutlet weak var addressField2: UILabel!
    @IBOutlet weak var postcodeField: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

