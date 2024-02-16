//
//  OtpViewController.swift
//  otpValidationScreen
//
//  Created by Cinta Jose on 13/02/24.
//

import UIKit

class OtpViewController: UIViewController, UITextFieldDelegate, TextFieldDelegateExtension {
    
    @IBOutlet var otpTextFieldCollection: [OtpTextField]!
    
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var resendReqLbl: UILabel!

    
    var otpAttempts = 5
    var secondsRemaining = 15


    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextFieldCollection.forEach { otpField in
            otpField.delegate = self
        }
        otpTextFieldCollection.first?.becomeFirstResponder()
        resendBtn.setTitleColor(.gray, for: .disabled)
        resendReqLbl.text = "\(otpAttempts) resend requests left"

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
    
    @IBAction func resendPressed(_ sender: UIButton) {
        if otpAttempts > 0 {
            otpAttempts = otpAttempts-1
            resendReqLbl.text = "\(otpAttempts) resend requests left"
            self.resendBtn.setTitle("Resend in \(self.secondsRemaining) seconds", for: .disabled)
            resendBtn.isEnabled = false
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.secondsRemaining > 0 {
                    self.secondsRemaining -= 1
                    self.resendBtn.setTitle("Resend in \(self.secondsRemaining) seconds", for: .disabled)
                } else {
                    Timer.invalidate()
                    self.secondsRemaining = 15
                    self.resendBtn.isEnabled = true
                }
            }
        } else {
            let message = "The maximum number of unsuccessful sign in attempts has been reached. Please try again later"
            let alert = UIAlertController(title: "Unable to Sign In", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    

}
