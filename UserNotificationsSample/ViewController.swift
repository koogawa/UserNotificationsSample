//
//  ViewController.swift
//  UserNotificationsSample
//
//  Created by koogawa on 2016/06/19.
//  Copyright © 2016年 koogawa. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let content = UNMutableNotificationContent()

        content.title = "Introduction to Notifications"
        content.body = "Let's talk about notifications!"

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let requestIdentifier = "sampleRequest"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().delegate = self

        UNUserNotificationCenter.current().add(request) {
            (error) in
            // ...
            print(error)
        }
    }

    // Called when tap notification
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: () -> Void) {
        print(#function)
        completionHandler()
    }

    // Called when receive remote/local notification
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        print(#function)
        completionHandler([.alert, .sound])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

