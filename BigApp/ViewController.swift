//
//  ViewController.swift
//  BigApp
//
//  Created by Hugh Jarvis on 14/11/2019.
//  Copyright © 2019 Hugh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keywordField: UITextField!
    @IBOutlet weak var complimentView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        keywordField.delegate = self
        
    }



    @IBAction func goTapped(_ sender: Any) {
        print("button was tapped")
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

