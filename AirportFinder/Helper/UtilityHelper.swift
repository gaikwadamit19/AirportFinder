//
//  UtilityHelper.swift
//  SampleHouseProj
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

//Utility helper helps to access Alert Controller easily from anywhere
class UtilityHelper {
    /**
     This method helps to access Alert Controller easily from anywhere
     
     - Parameter message: Text need to show to user.
     - Parameter viewController: On which AlertView will get shown.
     */
    static func showAlertView(message: String) {
        let alertController = UIAlertController(title: AlertStrings.Alert, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: AlertStrings.AlertButton, style: .default, handler: nil)
        alertController.addAction(alertAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
