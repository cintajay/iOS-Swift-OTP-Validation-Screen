//
//  TextFieldBackSpaceDelegate.swift
//  otpValidationScreen
//
//  Created by Cinta Jose on 15/02/24.
//

import Foundation

import UIKit

protocol TextFieldDelegateExtension : UITextFieldDelegate {
    func didPressBackspace(_ textField: OtpTextField)
}

class OtpTextField: UITextField {

    override func deleteBackward() {
        super.deleteBackward()

        if let otpDelegate = self.delegate as? TextFieldDelegateExtension {
            otpDelegate.didPressBackspace(self)
        }
    }
}
