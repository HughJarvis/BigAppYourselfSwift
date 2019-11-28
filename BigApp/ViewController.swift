//
//  ViewController.swift
//  BigApp
//
//  Created by Hugh Jarvis on 14/11/2019.
//  Copyright © 2019 Hugh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let complimentService = ComplimentService()

    @IBOutlet weak var keywordField: UITextField!
    @IBOutlet weak var complimentView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        keywordField.delegate = self
        
    }



    @IBAction func goTapped(_ sender: Any) {
        complimentView.font = UIFont.systemFont(ofSize: 14)
        complimentView.text! = "preparing compliment..."
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        
        self.complimentService.getCompliment(complimentCompletionHandler: { compliment, error in
            if let compliment = compliment {
                DispatchQueue.main.async    {
                    self.complimentView.text = compliment;
                    self.complimentView.font = UIFont.systemFont(ofSize: 24)
                }
            }
        })
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

