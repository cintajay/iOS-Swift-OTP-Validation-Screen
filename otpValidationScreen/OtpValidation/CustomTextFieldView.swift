//
//  CustomTextFieldView.swift
//  otpValidationScreen
//
//  Created by Cinta Jose on 15/02/24.
//

import UIKit

class OtpTextFieldView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "AppBlueColor")?.cgColor
    }
}
