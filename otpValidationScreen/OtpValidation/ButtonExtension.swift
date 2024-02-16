//
//  ButtonExtension.swift
//  otpValidationScreen
//
//  Created by Cinta Jose on 16/02/24.
//

import UIKit

extension UIButton{
    func setState(_ state: Bool){
        if state{
            self.isEnabled = true
            self.alpha = 1.0
        }else{
            self.isEnabled = false
            self.alpha = 0.5
        }
    }
}
