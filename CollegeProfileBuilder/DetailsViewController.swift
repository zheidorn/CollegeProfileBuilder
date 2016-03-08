//
//  DetailsViewController.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 2/25/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import Foundation

var currentDragon = College()
@IBOutlet weak var mylabel: UILabel!
override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = currentCollege.name
    mylabel.text = currentCollege.description