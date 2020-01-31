//
//  ViewController.swift
//  HOL4
//
//  Created by Mark Hawkins on 1/31/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var doomButton: UIButton!
    @IBOutlet var notDoomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Function to call when Doom View button is clicked (Touch Down)
    @IBAction func doomAlert (sender: UIButton) {
        //Initialize alert
        let alert = UIAlertController(title: "IT'S TIME FOR DOOOOOM!", message: "Have DOOOOM! commence in 5 seconds?", preferredStyle: .alert)
        
        //Add an action to the alert
        //Call showMessage (Another alert) to display outcome to user
        alert.addAction(UIAlertAction(title: "YES?", style: .default, handler: {action in
            self.showMessage("DOOOOM! Initiated", "Commencing in 5 Seconds")}))
        
        alert.addAction(UIAlertAction(title: "Maybe", style: .cancel, handler: { action in
            self.showMessage("DOOOOM!", "Initiated anyway")}))

        //Show alert
        self.present(alert, animated: true)
    }
    
    //Function to call when Not Doom button is clicked (Touch Down)
    @IBAction func notDoomAlert(Sender: UIButton) {
        //Initialize alert
        let alert = UIAlertController(title: "Avoid DOOOOM!", message: "What is your name savior?", preferredStyle: .alert)
        
        //Add a text field for a user to input text
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "Please give us the name of our savior"})
        
        //Add actions to the alert
        alert.addAction(UIAlertAction(title: "Nevermind", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save Everyone", style: .default, handler: {
            action in
                //Retrieve the text input from the Text Field the user has input info into
                //Call receive message if Text Field exists
            if let name = alert.textFields?.first?.text {
                if !name.isEmpty {
                    self.showMessage("DOOOOM! Initiated", "\(name), you have betrayed us..")
                }
                else {
                    self.showMessage("DOOOOM! Initiated", "You have betrayed us..")
                }
            }
        }))
        
        //Show alert
        self.present(alert, animated: true)
    }
    
    //Function to display after a button has been clicked
    func showMessage (_ title: String, _ text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

}

