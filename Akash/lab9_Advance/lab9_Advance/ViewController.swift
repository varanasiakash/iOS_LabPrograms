//
//  ViewController.swift
//  lab9_Advance
//
//  Created by student on 14/06/22.
//

import UIKit

import UserNotifications

class ViewController: UIViewController ,UNUserNotificationCenterDelegate{
    
    @IBOutlet var notifyButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow, error in})
        
    }
    
    @IBAction func localNotificationButtonClick()
    {
        let content = UNMutableNotificationContent()
        
        content.title = "JAIN UNIVERSITY"
        content.subtitle = "Apple's iOS Lab"
        content.body = "We are learning about iOS Local Notification"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "Simplifed iOS Notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }

}

