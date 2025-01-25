//
//  ReadContents.swift
//  swiftuiutility
//
//  Created by ke on 1/25/25.
//

import SwiftData

/*
 If you're struggling with SwiftData, not sure whether your data is missing or your queries are bad, sometimes the easiest thing to do is inspect the underlying database directly – it's just SQLite, so you can read it using the built-in sqlite3 command on your Mac.

 Because this is something I do a lot, I have a small extension I use in my projects that prints the full command to run to open the current container using the sqlite3 command:
 */
extension ModelContext {
    var sqliteCommand: String {
        if let url = container.configurations.first?.url.path(percentEncoded: false) {
            "sqlite3 \"\(url)\""
        } else {
            "No SQLite database found."
        }
    }
}

//print(modelContext.sqliteCommand)

/*
 Once you have the command, copy all of it – from sqlite3 all the way through to the ending quote mark, and run it from your Mac's Terminal app. You should see the version number of your SQLite program, followed by sqlite>, which is the prompt where you can enter commands.

 If you're new to SQLite, here are some basics:

 * Type .sch and press return to show your database schema, which will list the SQL commands to create all the tables (data stores) and indexes (fast lookups) for your SwiftData work.
 * Type .tab and press return to just show the names of tables.
 * Type SELECT * FROM xxx; and press return to show all the objects inside the table "xxx". Core Data (and therefore Swift Data) use table names that are the letter "Z" followed by your model name. So, to show all User model objects, you'd use SELECT * FROM ZUSER;
 * Press Ctrl+D to exit SQLite when you're done.
 There are many more useful SQL commands to know, but if I were you I'd restrict your work to just reading data – although you can technically insert, modify, or delete data, you're likely to confuse SwiftData.
 */
