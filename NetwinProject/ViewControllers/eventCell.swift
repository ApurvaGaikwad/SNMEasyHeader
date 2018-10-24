//
//  eventCell.swift
//  NetwinProject
//
//  Created by Apurva Gaikwad on 26/09/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

import UIKit
//Added Commenting
class eventCell: UITableViewCell {
    @IBOutlet weak var textfieldEventName: UITextField!
    @IBOutlet weak var textfieldEventDescription: UITextField!
    
    @IBOutlet weak var textfeildEvetKeywords: UITextField!
    
    @IBOutlet weak var textfieldEventLocation: UITextField!
    
    @IBOutlet weak var textfieldEventUrl: UITextField!
    
    @IBOutlet weak var textfieldStartDate: UITextField!
    
    @IBOutlet weak var textfieldEnddate: UITextField!
    let datePicker = UIDatePicker()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Date picker Setup toolbar
        datePicker.datePickerMode = UIDatePicker.Mode.date
        textfieldStartDate.inputView = datePicker
        textfieldEnddate.inputView = datePicker
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(eventCell.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(eventCell.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textfieldStartDate.inputAccessoryView = toolBar
        textfieldEnddate.inputAccessoryView = toolBar
        
        //Set icons to textfields
        SetLeftImage(image: "eventName1", textField: textfieldEventName)
        SetLeftImage(image: "eventName", textField: textfeildEvetKeywords)
        SetLeftImage(image: "web", textField: textfieldEventUrl)
        SetLeftImage(image: "location", textField: textfieldEventLocation)
        
        //All textfields according to design(Bottom line only)
        DispatchQueue.main.async { [unowned self] in
            self.designTextfield(textfield: self.textfieldEventName)
            self.designTextfield(textfield: self.textfieldEventLocation)
            self.designTextfield(textfield: self.textfieldStartDate)
            self.designTextfield(textfield: self.textfieldEnddate)
            self.designTextfield(textfield: self.textfieldEventUrl)
            self.designTextfield(textfield: self.textfeildEvetKeywords)
            
        }
        
        //Description Textfield layout
        textfieldEventDescription.layer.borderColor = UIColor.darkGray.cgColor
        textfieldEventDescription.layer.borderWidth = CGFloat(0.3)
        
        //padding for all textfields
        textfieldEventName.setLeftPaddingPoints(5)
        textfieldEventDescription.setLeftPaddingPoints(5)
        textfieldEventUrl.setLeftPaddingPoints(5)
        textfieldEventLocation.setLeftPaddingPoints(5)
        textfeildEvetKeywords.setLeftPaddingPoints(5)
        textfieldStartDate.setLeftPaddingPoints(5)
        textfieldEnddate.setLeftPaddingPoints(5)
        
    }
    
    //padding for all textfields
    func SetLeftImage(image:String, textField: UITextField) -> Void {
        textField.leftViewMode = .always
        let imageContaner = UIView(frame:CGRect(x: textField.frame.origin.x, y: textField.frame.origin.y, width: 30, height: 30))
        let imageViews = UIImageView(frame: CGRect(x: 5, y: 5, width: 20, height: 20))
        imageViews.image = UIImage (named: image)
        imageContaner.addSubview(imageViews)
        textField.leftView = imageContaner
        
    }
    
    //All textfields according to design(Bottom line only)
    func designTextfield(textfield:UITextField) -> Void {
        let border = CALayer()
        let borderWidth = CGFloat(0.3)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :textfield.frame.size.height - borderWidth), size: CGSize(width: textfield.frame.size.width, height: textfield.frame.size.height))
        border.borderWidth = borderWidth
        textfield.layer.addSublayer(border)
        textfield.layer.masksToBounds = true
    }
    
    
     //Date picker toolbar Done Button
    @objc func doneClick() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM dd yyyy  h:mm a"
        let strDate = dateFormatter.string(from: datePicker.date)
        print("startdate:\(strDate)")
        
        
        if textfieldStartDate.isEditing == true {
            textfieldStartDate.text = strDate
            textfieldStartDate.resignFirstResponder()
        }
        
        if textfieldEnddate.isEditing == true {
            textfieldEnddate.text = strDate
            textfieldEnddate.resignFirstResponder()
        }
    }
    //Date picker toolbar Cancel Button
    @objc func cancelClick() {
        textfieldStartDate.resignFirstResponder()
        textfieldEnddate.resignFirstResponder()
    }
}
