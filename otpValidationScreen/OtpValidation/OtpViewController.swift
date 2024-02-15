//
//  OtpViewController.swift
//  otpValidationScreen
//
//  Created by Cinta Jose on 13/02/24.
//

import UIKit

class OtpViewController: UIViewController, UITextFieldDelegate, TextFieldDelegateExtension {
    
    @IBOutlet var otpTextFieldCollection: [OtpTextField]!


    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextFieldCollection.forEach { otpField in
            otpField.delegate = self
        }
        otpTextFieldCollection.first?.becomeFirstResponder()

    }
    
    @IBAction func emailTextFieldEditChange(_ sender: UITextField) {
        if sender.hasText {
            if let index = otpTextFieldCollection.firstIndex(of: sender as! OtpTextField) {
                if otpTextFieldCollection.indices.contains(index+1) {
                    otpTextFieldCollection[index+1].becomeFirstResponder()
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range == NSRange(location: 1, length: 0) {  //cursor placed after number
            emailTextFieldEditChange(textField)
            return false
        } else if textField.hasText && range == NSRange(location: 0, length: 0) { //cursor placed before number
            return false
        } else {
            return true
        }
    }
    
    func didPressBackspace(_ textField: OtpTextField) {
        if let index = otpTextFieldCollection.firstIndex(of: textField) {
            if otpTextFieldCollection.indices.contains(index-1) {
                otpTextFieldCollection[index-1].becomeFirstResponder()
            }
        }
    }
    

    

}
