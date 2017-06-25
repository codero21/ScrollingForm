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
    
    var keyboardHeight: Float = 0.0
    var currentTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
        addressField1.delegate = self
        addressField2.delegate = self
        postcodeField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow , object: self.view.window)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidHide(sender:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Keyboard methods
    
    func keyboardDidShow(_ sender: NSNotification!) {
        // get height of keyboard
        let info: NSDictionary = sender.userInfo! as NSDictionary
        
        let value: NSValue = info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        
        let keyboardFrame: CGRect = value.cgRectValue
        
        // convert from Core Graphics 'CGFloat' to Swift 'Float'.
        let cgFloatKeyboardHeight: CGFloat = keyboardFrame.size.height
        
        keyboardHeight = Float(cgFloatKeyboardHeight)
        
        // ensure current text field is visible,
        // if not adjust the contentOffSet
        // of the scrollView appropriately
        let textFieldTop: Float = Float(currentTextField.frame.origin.y)
        let textFieldBottom: Float = textFieldTop + Float(currentTextField.frame.size.height)
        
        if (textFieldBottom > keyboardHeight) {
            scrollView.setContentOffset(CGPoint(x: 0, y: CGFloat(textFieldBottom - keyboardHeight)), animated: true)
        }
    
    }

    func keyboardDidHide(sender: NSNotification) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }
    
    
    // TextField methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
        
        var textFieldTop: Float = Float(currentTextField.frame.origin.y)
        var textFieldBottom: Float = textFieldTop + Float(currentTextField.frame.size.height)
        
        if textFieldBottom > keyboardHeight && keyboardHeight != 0.0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: CGFloat(textFieldBottom - keyboardHeight)), animated: true)
        }
        
    }
    
    

}

