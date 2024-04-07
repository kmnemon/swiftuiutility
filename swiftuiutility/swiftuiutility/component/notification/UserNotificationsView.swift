//
//  UserNotificationsView.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI
import UserNotifications



struct UserNotificationsView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
//                var dateComponents = DateComponents()
//                dateComponents.hour = 9
//                
//                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    UserNotificationsView()
}
