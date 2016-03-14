//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 2/24/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import Foundation
class College
{
    var name: String
    var location: String
    var numberOfStudents: String
    var image: String
    var webPage: String
    
    init(Name n: String, Location l: String, numberOfStudents nof: String, image i: String, webPage w: String )
    {
        name = n
        location = l
        numberOfStudents = nof
        image = i
        webPage = w
    }
    init()
    {
        name = ""
        location = ""
        numberOfStudents = ""
        image = ""
        webPage = ""
    }
}