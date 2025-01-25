//
//  Untitled.swift
//  swiftuiutility
//
//  Created by ke on 1/25/25.
//

/*
 To see the SQL commands being used by SwiftData and Core Data, add the launch argument -com.apple.CoreData.SQLDebug 1 in Xcode's scheme editor.

 To do this, go to the Product menu, hold down the Option key, then click "Run…". Now select the Arguments tab, and click the + button under "Arguments Passed on Launch". This is where you should paste in the option: -com.apple.CoreData.SQLDebug 1.

 Now when you click run you'll see a whole lot of Core Data debug information fly by in Xcode's console – and it will be Core Data logs, because that's what SwiftData is using behind the scenes. This is a great way to see it creating various database tables, running queries, inserting objects, and more.

 There are four bonus tips here:

 1. When you're finished with the launch argument, don't delete it! Instead, just uncheck its box so it remains present but disabled, which makes it easier to reactivate in the future if you need it again.
 2. If you need even more information, you can use -com.apple.CoreData.SQLDebug 3 to get vast amounts of detail about what's happening under the hood, including faults being triggered, individual model objects being created from data, and more.
 3. Don't forget that you can also debug SwiftData using the Data Persistence instrument in Instruments, which reports back faults, fetches, saves, and more.
 4. In the older days of Core Data, you would often want to use a second launch argument: -com.apple.CoreData.ConcurrencyDebug 1. This is much less relevant with SwiftData because of its support for modern Swift concurrency.
 */
