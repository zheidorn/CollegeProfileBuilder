//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var CollegeArray:[College] = [College]()
    var nameVariable = ""
    var locationVariable = ""
    var numberOfStudents = 0
    var webPage = ""
   
    @IBOutlet weak var editButton2: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton2.tag = 0
        
        let CollegeZero = College(Name: "University of Wisconsin", Location: "Madison, Wisconsin", numberOfStudents: "43,193", image: "wisconsinMascot", webPage: "wisc.edu/")
        CollegeArray.append(CollegeZero)
        let CollegeOne = College(Name: "Syracuse University", Location: "Syracuse, New York", numberOfStudents: "21,492", image: "SyracuseMascot", webPage: "syr.edu/")
        CollegeArray.append(CollegeOne)
        let CollegeTwo = College(Name: "University of Texas", Location: "Austin Texas", numberOfStudents: "50,950", image: "TexasMascot", webPage: "utexas.edu/" )
        CollegeArray.append(CollegeTwo)
        myTableView.dataSource = self
        myTableView.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadlist:", name: "load", object: nil)
        self.myTableView.reloadData()
        
    }
    func loadlist(notification:NSNotificationCenter)
    {
        self.myTableView.reloadData()
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CollegeArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        
        let currentCollege = CollegeArray[indexPath.row]
        currentCell.textLabel!.text = currentCollege.name
        currentCell.detailTextLabel!.text? = currentCollege.location
        
        return currentCell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as! DetailsViewController
        let currentCollege = CollegeArray[(myTableView.indexPathForSelectedRow?.row)!]
        nvc.currentCollege = currentCollege
    
    
    
       
   
    }
    @IBAction func myButton(sender: UIBarButtonItem) {
    
    let alert = UIAlertController(title: "Add a College", message: nil, preferredStyle: UIAlertControllerStyle.Alert)

    
    var nameField: UITextField!
    var locationField: UITextField!
    var numberField: UITextField!
    
    func nameTextField(textField: UITextField!)
    {
        textField.placeholder = "College Name"
        nameField = textField
    }
    func locationTextField(textField: UITextField!)
    {
        textField.placeholder = "Location"
        locationField = textField
    }
    func numberTextField(textField: UITextField!)
    {
        textField.placeholder = "Number Of Students"
        numberField = textField
    }
    alert.addTextFieldWithConfigurationHandler(nameTextField)
    alert.addTextFieldWithConfigurationHandler(locationTextField)
    alert.addTextFieldWithConfigurationHandler(numberTextField)
  
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
    alert.addAction(cancelAction)
  
    
    let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler:
        { (action) -> Void in
            
            let numberVariable = Int(numberField.text!)
            self.CollegeArray.append(College(Name: nameField.text!, Location: locationField.text! , numberOfStudents: numberField.text!, image: "", webPage: ""))
            self.myTableView.reloadData()
    })
    
    
    alert.addAction(addAction)
    self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func editButton(sender: UIBarButtonItem) {
        
        if(sender.tag == 0) {
            myTableView.editing = true
            sender.tag = 1
            editButton2.title = "Done"
            
        } else {
            myTableView.editing = false
            sender.tag = 0
            editButton2.title = "Edit"
            
        }
       

    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            CollegeArray.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            myTableView.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let itemToMove = CollegeArray[fromIndexPath.row]
        CollegeArray.removeAtIndex(fromIndexPath.row)
        CollegeArray.insert(itemToMove, atIndex: toIndexPath.row)
        
    }
    
    
    
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    
   
}








/*func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
if editingStyle == UITableViewCellEditingStyle.Delete {
CollegeArray.removeAtIndex(indexPath.row)

tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)



}
}*/
