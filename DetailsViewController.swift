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
    var picker = UIImagePickerController()
    var photos = [UIImage]()
    var count = 0
    
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = currentCollege.name
//        let button = UIBarButtonItem(title: "Hello", style: .Done, target: nil, action:  )
//        self.navigationItem.rightBarButtonItem = button
        textField1.text = currentCollege.location
        textField2.text = "Number of Students: \(currentCollege.numberOfStudents)"
        textField3.text = currentCollege.name
        myImageView.image = UIImage(named: currentCollege.image)
        textField4.text = currentCollege.webPage
        

    }
   
    @IBAction func saveButton(sender: UIButton) {
        currentCollege.location = textField1.text!
        currentCollege.numberOfStudents = textField2.text!
        currentCollege.name = textField3.text!
        self.navigationItem.title = currentCollege.name
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//            let nvc = segue.destinationViewController as! WebPageViewController
//            nvc.webSite = currentCollege.webPage

        
        if segue.identifier == "zach"
        {
            let evc = segue.destinationViewController as! MapViewController
            let wvc = segue.destinationViewController as! MapViewController
            wvc.name = currentCollege.name
            evc.location = currentCollege.location
        }
        
        else
        {
            let nvc = segue.destinationViewController as! WebPageViewController
            nvc.webSite = self.currentCollege.webPage
        }
        
        
    }
    
    
    
    
    @IBAction func GalleryButton(sender: UIButton) {
        let actionSheet = UIAlertController(title: "title", message: nil, preferredStyle:  .ActionSheet)
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        let Library = UIAlertAction(title: "PHOTO LIBRARY", style: .Default) { (action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.picker, animated: true, completion: nil)}
        actionSheet.addAction(Library)
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
            picker.dismissViewControllerAnimated(true, completion: {
                let selectedImage = info[UIImagePickerControllerOriginalImage]
                    as! UIImage
                self.myImageView.image = selectedImage
                
                
            })
            
        }
    
        presentViewController(actionSheet, animated: true, completion: nil)
        
    }
   






   
    
}
