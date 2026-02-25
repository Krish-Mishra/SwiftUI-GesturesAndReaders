//
//  LocalNotificationsView.swift
//  SwiftUI-LongPressGesture
//
//  Created by Krish Mishra on 25/02/26.
//

//types of Triggers
//1. Time
//2. calender
//3. location


import SwiftUI
import UserNotifications // for local notifications
import CoreLocation // for current location

class NotificationManager {
    static let instance = NotificationManager() //Singleton
    
    func reqAuthorizaton() {
        let options : UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!" //alert
        content.subtitle = "This was sooooo easy!!!"
        content.sound = .default //sound
        content.badge = 1 //badge
        
        //time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //calender
//        var dateComponents = DateComponents()
//        dateComponents.hour = 21
//        dateComponents.minute = 56
        
        //location
        let coord = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        let region = CLCircularRegion(
            center: coord,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true //when user enters in radius of region
        region.notifyOnExit = true //when user exits from the radius of region
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger:trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationsView: View {
    var body: some View {
        VStack(spacing : 20) {
            Button("Request Permission") {
                NotificationManager.instance.reqAuthorizaton()
            }
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotifications()
            }
        }
        .onAppear {
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    LocalNotificationsView()
}
