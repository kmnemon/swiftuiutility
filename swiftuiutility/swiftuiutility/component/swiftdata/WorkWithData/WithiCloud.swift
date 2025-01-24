//
//  WithiCloud.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

//1.syncing SwiftData with iClound
/*
 https://www.hackingwithswift.com/quick-start/swiftdata/how-to-sync-swiftdata-with-icloud
 SwiftData comes with built-in support for iCloud syncing using CloudKit. It's absurdly easy to use – literally zero code required in some situations – but it does not support the public or shared database.

 Important: If you need to use the public or shared database, you need to use NSPersistentCloudKitContainer either by itself or with SwiftData coexistence.

 If you want to sync your app's data to iCloud, go to the Signing & Capabilities settings for your app's target, then:

 * Add the iCloud capability.
 * Select CloudKit from its options.
 * Press + to add a new CloudKit container, or select one of your existing ones.
 * Add the Background Modes capability.
 * Check the box "Remote Notifications" checkbox from its options.
 …and that's it: your app is now configured to sync all its data with iCloud.

 Tip: Although you can attempt to test iCloud support in the simulator, I've found it rarely works well – it's much better to test on a real device.

 Although the configuration is complete, you might need to make some changes to your SwiftData models because CloudKit has a few very specific requirements. Annoyingly, if you don't follow these requirements your iCloud sync will silently fail, so here they are:

 You cannot use @Attribute(.unique) on any property you want to sync to CloudKit.
 All properties must either have default values or be marked as optional, alongside their initializer.
 All relationships must be marked optional. This is Particularly Annoying™, but it's a requirement so there's not much we can do.
 As long as you make those changes for all your models, they will sync to CloudKit automatically. If your user later deletes your app from their device then reinstalls it, SwiftData will automatically fetch their old data from iCloud and sync it locally too.

 When working with CloudKit, you're likely to find Apple's CloudKit Dashboard a useful resource for seeing how CloudKit stores your data. You can find it here https://icloud.developer.apple.com/dashboard.
 */

//2.stop SwiftData syncing with CloudKit
//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-stop-swiftdata-syncing-with-cloudkit
/*
 do {
     let config = ModelConfiguration(cloudKitDatabase: .none)
     container = try ModelContainer(for: Restaurant.self, configurations: config)
 } catch {
     fatalError("Failed to create model container.")
 }
 */
