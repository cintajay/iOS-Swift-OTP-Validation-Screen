//
//  MainViewController.swift
//  otpValidationScreen
//
//  Created by Cinta Jose on 13/02/24.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goToOTPScreen()
    }
    
    func goToOTPScreen() {
        let story = UIStoryboard(name: "OtpStoryboard", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
