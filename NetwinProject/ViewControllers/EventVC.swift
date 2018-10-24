//
//  EventVC.swift
//  NetwinProject
//
//  Created by Apurva Gaikwad on 26/09/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

import UIKit
import MapKit


class EventVC: UIViewController,UITableViewDataSource,UITableViewDelegate,MKMapViewDelegate,UITextFieldDelegate {
    
    var mapView: MKMapView?
    var window: UIWindow?
    var eventName = String()
    var eventDescription = String()
    var eventKeywords = String()
    var eventlocation = String()
    var eventUrl = String()
    var eventStartDate = String()
    var eventEndDate = String()
    
    
    @IBOutlet weak var tableview: UITableView!
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableview.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        tableview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.image = UIImage.init(named: "MapImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
   
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
    
    //status bar text color
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // Header to be scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! eventCell
        
        // Set delegate for textfield
        Cell.textfieldEventName.delegate = self
        Cell.textfieldEnddate.delegate = self
        Cell.textfieldStartDate.delegate = self
        Cell.textfieldEventUrl.delegate = self
        Cell.textfieldEventLocation.delegate = self
        Cell.textfeildEvetKeywords.delegate = self
        Cell.textfieldEventDescription.delegate = self
        
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
   //  textfield tag to all fields
        if textField.tag == 0
        {
            eventName = textField.text!
            print("eventName:\(eventName)")
        }
        else if textField.tag == 1
        {
            eventDescription = textField.text!
            print("eventName:\(eventDescription)")
        }
        else if textField.tag == 2
        {
            eventKeywords = textField.text!
            print("eventName:\(eventKeywords)")
        }
        else if textField.tag == 3
        {
            eventlocation = textField.text!
            print("eventName:\(eventlocation)")
        }
        else if textField.tag == 4
        {
            eventUrl = textField.text!
            print("eventName:\(eventUrl)")
        }
        else if textField.tag == 5
        {
            eventStartDate = textField.text!
            print("eventName:\(eventStartDate)")
        }
        else if textField.tag == 6
        {
            eventEndDate = textField.text!
            print("eventName:\(eventEndDate)")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count != 0
        {
            if textField.tag == 0
            {
                eventName = textField.text!
                print("eventName:\(eventName)")
            }
            else if textField.tag == 1
            {
                eventDescription = textField.text!
                print("eventName:\(eventDescription)")
            }
            else if textField.tag == 2
            {
                eventKeywords = textField.text!
                print("eventName:\(eventKeywords)")
            }
            else if textField.tag == 3
            {
                eventlocation = textField.text!
                print("eventName:\(eventlocation)")
            }
            else if textField.tag == 4
            {
                eventUrl = textField.text!
                print("eventName:\(eventUrl)")
            }
            else if textField.tag == 5
            {
                eventStartDate = textField.text!
                print("eventName:\(eventStartDate)")
            }
            else if textField.tag == 6
            {
                eventEndDate = textField.text!
                print("eventName:\(eventEndDate)")
            }
        }
        else
        {
            if textField.tag == 0
            {
                eventName = textField.text!
                print("eventName:\(eventName)")
            }
            else if textField.tag == 1
            {
                eventDescription = textField.text!
                print("eventName:\(eventDescription)")
            }
            else if textField.tag == 2
            {
                eventKeywords = textField.text!
                print("eventName:\(eventKeywords)")
            }
            else if textField.tag == 3
            {
                eventlocation = textField.text!
                print("eventName:\(eventlocation)")
            }
            else if textField.tag == 4
            {
                eventUrl = textField.text!
                print("eventName:\(eventUrl)")
            }
            else if textField.tag == 5
            {
                eventStartDate = textField.text!
                print("eventName:\(eventStartDate)")
            }
            else if textField.tag == 6
            {
                eventEndDate = textField.text!
                print("eventName:\(eventEndDate)")
            }
        }
    }
    
    @IBAction func createButtonClicked(_ sender: Any) {
        
        var validationString = "Event Details"
        
        if eventName.isEmpty || eventDescription.isEmpty || eventKeywords.isEmpty || eventlocation.isEmpty || eventUrl.isEmpty || eventStartDate.isEmpty || eventEndDate.isEmpty  {
            print("SOme Error Occur");
            let alert = UIAlertController(title: validationString, message: "Please enter all fields", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
          //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        else
        {
            print("Success !!");
            let alert = UIAlertController(title: validationString, message: "Success !!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
       
    }

}

//Padding for textfields
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    
}
