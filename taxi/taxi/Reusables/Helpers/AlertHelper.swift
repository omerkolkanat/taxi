//
//  AlertHelper.swift
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 9.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

import Foundation

class AlertHelper: NSObject {
    
    enum AlertMessage: String {
        case NetworkErrorMessage = "Network Error. Please try again"
    }
    
    enum AlertTitle: String {
        case Warning = "Warning"
        case Error = "Error"
    }
    
    /**
     Shows the Alert with given title and message.
     - Parameter title: Title of the alert.
     - Parameter message: Message of the alert.
     - Parameter fromController: UIViewController that shows the alert.
     */
    @objc static func showAlert(title: String, message: String, fromController: UIViewController) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertAction.Style.default,
                                                handler: nil))
        fromController.present(alertController, animated: true, completion: nil)
    }
    
    /**
     Shows the Network Error Alert.
     - Parameter fromController: UIViewController that shows the alert.
     */
    @objc static func showNetworkErrorAlert(fromController: UIViewController){
        showAlert(title: AlertTitle.Warning.rawValue,
                  message: AlertMessage.NetworkErrorMessage.rawValue,
                  fromController: fromController)
    }
}
