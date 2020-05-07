//
//  GigDetailViewController.swift
//  ios-gigs
//
//  Created by Iyin Raphael on 5/7/20.
//  Copyright © 2020 Iyin Raphael. All rights reserved.
//

import UIKit

class GigDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBOutlet weak var jobTitleTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
    }
}
