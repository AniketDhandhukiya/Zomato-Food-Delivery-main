//
//  otpPAge.swift
//  Zomato-Food Delivery
//
//  Created by R83 on 19/04/23.
//

import UIKit
import UserNotifications

class otpPAg: UIViewController {
    
    var otpArray = ["5625","5325","4679","5164","9652","5346","9564","2549","7921","5652","7941","6794","5613","7894","8945","1597"]

    
    @IBOutlet weak var otpView: DPOTPView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func otpContinueAction(_ sender: Any) {
        if otpView.text == "" {
            let alert = UIAlertController.init(title: "OTP", message: "Please Enter a OTP", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
//        if (otpArray.randomElement() != nil) == otpView.validate(){
//            let nv = storyboard?.instantiateViewController(withIdentifier: "zomatoMainPag") as! zomatoMainPag
//            navigationController?.pushViewController(nv, animated: true)
//        }
        
      
    }
    
    @IBAction func sendAction(_ sender: Any) {
        let authoptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        UNUserNotificationCenter.current().requestAuthorization(options: authoptions) { success, error in
            print("error", error?.localizedDescription)
        }
        let content = UNMutableNotificationContent()
        content.title = "Zomato"
        content.body = "otp = \(otpArray.randomElement()!)"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let id = UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        let noti = UNUserNotificationCenter.current()
        
        
        noti.add(request) { error in
            print(error?.localizedDescription)
        }
    }
    
}
