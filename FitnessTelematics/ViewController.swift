//
//  ViewController.swift
//  SampleApp
//
//  Created by Sridhar Vemula on 2/25/15.
//  Copyright (c) 2015 Sridhar Vemula. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController, UITableViewDataSource {
    
    /*
        Need to add two more may be jawbone and nike 
        Fitbit oauth works
        withings oauth works
        jawbone noooo
        misfit oauth works
    */
    
    var services = ["Fitbit", "Withings", "Jawbone", "Misfit"]
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "OAuth"
       
        //doOAuthJawbone()
        //doOAuthMisfit()
        //doOAuthWithings()
        //doOAuthFitbit()
        /* var m = URLData(urlString: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=dc806e6e0c190740d13e1c36cc4cc1f9&tags=dog&format=json&nojsoncallback=1")
        let json = m.getJSON()
        println(json["photos"]["photo"][0]["secret"].string!)
        */
}
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        cell.textLabel!.text = services[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            doOAuthFitbit()
        } else if indexPath.row == 1 {
            doOAuthWithings()
        } else if indexPath.row == 2 {
            doOAuthJawbone()
        } else if indexPath.row == 3 {
            doOAuthMisfit()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func doOAuthFitbit(){
        let oauthswift = OAuth1Swift(
            consumerKey:    Fitbit["consumerKey"]!,
            consumerSecret: Fitbit["consumerSecret"]!,
            requestTokenUrl: "https://api.fitbit.com/oauth/request_token",
            authorizeUrl:    "https://www.fitbit.com/oauth/authorize",
            accessTokenUrl:  "https://api.fitbit.com/oauth/access_token"
        )
        oauthswift.authorizeWithCallbackURL( NSURL(string: "sample-app://fitbit")!, success: {
            credential, response in
            self.showAlertView("Fitbit", message: "oauth_token:\(credential.oauth_token)\n\noauth_toke_secret:\(credential.oauth_token_secret)")
            }, failure: {(error:NSError!) -> Void in
                println(error.localizedDescription)
        })
    }
    
    func doOAuthWithings(){
        let oauthswift = OAuth1Swift(
            consumerKey: Withings["consumerKey"]!,
            consumerSecret: Withings["consumerSecret"]!,
            requestTokenUrl: "https://oauth.withings.com/account/request_token",
            authorizeUrl: "https://oauth.withings.com/account/authorize",
            accessTokenUrl: "https://oauth.withings.com/account/access_token"
        )
        
        oauthswift.authorizeWithCallbackURL(NSURL(string: "sample-app://withings")!, success: {
            credential, response in
            self.showAlertView("Withings",message: "oauth_token:\(credential.oauth_token)\n\noauth_token_secret:\(credential.oauth_token_secret)")
            }, failure: {(error:NSError!) -> Void in
                println(error.localizedDescription)
        })
    }
    
    func doOAuthJawbone() {
        let oauthswift = OAuth2Swift(
            consumerKey: Jawbone["consumerKey"]!,
            consumerSecret: Jawbone["consumerSecret"]!,
            authorizeUrl: "https://jawbone.com/auth/oauth2/auth",
            accessTokenUrl: "https://jawbone.com/auth/oauth2/token",
            responseType: "code"
        )
        
        oauthswift.authorizeWithCallbackURL(NSURL(string: "sample-app://jawbone")!, scope: "basic_read", state: "JAWBONE", success: {
            credential, response in
            self.showAlertView("Withings",message: "oauth_token:\(credential.oauth_token)\n\noauth_token_secret:\(credential.oauth_token_secret)")
            }, failure: {(error:NSError!) -> Void in
                println(error.localizedDescription)
        })
    }
    
    
    func doOAuthMisfit() {
        let oauthswift = OAuth2Swift(
            consumerKey: Misfit["consumerKey"]!,
            consumerSecret: Misfit["consumerSecret"]!,
            authorizeUrl: "https://api.misfitwearables.com/auth/dialog/authorize",
            accessTokenUrl: "https://api.misfitwearables.com/auth/tokens/exchange",
            responseType: "code"
        )
        
        oauthswift.authorizeWithCallbackURL(NSURL(string: "sample-app://misfit")!, scope: "", state: "MISFIT", success: {
            credential, response in
            self.showAlertView("Withings",message: "oauth_token:\(credential.oauth_token)\n\noauth_token_secret:\(credential.oauth_token_secret)")
            }, failure: {(error:NSError!) -> Void in
                println(error.localizedDescription)
        })
    }
    
    
    @IBAction func showAddPopup(sender: AnyObject) {
        var alert2 = UIAlertController(title: "New Name", message: "Add new Name", preferredStyle: UIAlertControllerStyle.Alert)
        alert2.addTextFieldWithConfigurationHandler({(textField) -> Void in textField.placeholder = "Some Default"})
        alert2.addAction(UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) -> Void in
                let textField = alert2.textFields![0] as UITextField
                let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            
                let managedContext = appDelegate.managedObjectContext!
            
            let entity = NSEntityDescription.entityForName("People", inManagedObjectContext: managedContext)
            
            let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            self.people.append(person)
            
            //self.names.append(textField.text)
            }))
        
        alert2.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert2, animated: true, completion: nil)
        
    }
    
    
    func showAlertView(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
