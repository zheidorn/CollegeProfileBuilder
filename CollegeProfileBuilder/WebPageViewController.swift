//
//  WebPageViewController.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 3/15/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class WebPageViewController: UIViewController, UIWebViewDelegate  {

    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var myWebView: UIWebView!
    var webSite = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string:"http://www." + webSite)!))
        
        
        
        
    

    }
    func startSpinning() {
    self.myWebView.alpha = 0
     loading.startAnimating()
    }
    
    func stopSpinning() {
    self.myWebView.alpha = 1
        loading.stopAnimating()
    }

    @IBAction func backButton(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
    }
   

}
