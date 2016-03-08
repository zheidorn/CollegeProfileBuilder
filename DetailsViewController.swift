//
//  DetailsViewController.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 2/25/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var currentCollege = College()
    
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = currentCollege.name
        textField1.text = currentCollege.location
        textField2.text = "Number of Students: \(currentCollege.numberOfStudents)"
        textField3.text = currentCollege.name
        myImageView.image = UIImage(named: currentCollege.image)
        



    }
   
    @IBAction func saveButton(sender: UIButton) {
        currentCollege.location = textField1.text!
        currentCollege.numberOfStudents = textField2.text!
        currentCollege.name = textField3.text!
        self.navigationItem.title = currentCollege.name
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        
    }
}
