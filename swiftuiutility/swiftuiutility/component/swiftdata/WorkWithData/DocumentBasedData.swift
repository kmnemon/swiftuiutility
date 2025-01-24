//
//  DocumentBasedData.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI

import UniformTypeIdentifiers
/*
 https://www.hackingwithswift.com/quick-start/swiftdata/how-to-create-a-document-based-app-with-swiftdata
 1, you need to go to the Info tab for your target and add an entry under Exported Type Identifiers. For this project I would use the following values:

 Description: Feedback report
 Identifier: com.yoursite.feedbackreport
 Conforms To: com.apple.package
 Extension: feedback
 Important: All of those are customizable to fit your app's needs, apart from the "Conforms To" value, which must always be "com.apple.package".

 2, you need to add an entry to the list of custom target properties. This means right-clicking on an existing row and selecting Add Row, then using that new row to see Supports Document Browser to YES.

 3, you need to create a custom UTType object using the same identifier you just declared for your target. Something like this is enough:
 4,And finally, you need to edit your App struct to replace this line of code:
 
 WindowGroup {
 With a DocumentGroup like this one:

 DocumentGroup(editing: FeedbackReport.self, contentType: .feedbackReport) {
 Important: You must not use the modelContainer() modifier when working with a SwiftData document-based app.
 
 As I said earlier, SwiftData silently creates separate storage for each new document along with any associated files used in your data models, meaning that if you use @Attribute(.externalStorage) on any of your model properties those external files will be stored in your document. This is why it's so important to conform to "com.apple.package" – your "document" is really a directory of data containing the underlying SQLite database and all its external files.
 */

//document-based app
struct DocumentBasedData {
    @Model
    class FeedbackReport {
        var title: String
        var content: String
        var priority: Int

        init(title: String, content: String, priority: Int) {
            self.title = title
            self.content = content
            self.priority = priority
        }
    }
    
    //Edit
    struct EditReportView: View {
        @Bindable var report: FeedbackReport

        var body: some View {
            Form {
                TextField("Issue title", text: $report.title)
                TextField("Issue description", text: $report.content, axis: .vertical)

                Picker("Priority", selection: $report.priority) {
                    Text("Low").tag(3)
                    Text("Medium").tag(2)
                    Text("High").tag(1)
                }
            }
            .navigationTitle("Edit Report")
        }
    }
    
    //Read
    struct ContentView: View {
        @Query(sort: \FeedbackReport.priority, order: .reverse) var reports: [FeedbackReport]
        @Environment(\.modelContext) var modelContext
        @State private var navigationPath = [FeedbackReport]()

        var body: some View {
            NavigationStack(path: $navigationPath) {
                List(reports) { report in
                    NavigationLink(value: report) {
                        VStack(alignment: .leading) {
                            Text(report.title)
                                .font(.headline)

                            Text(report.content)
                                .lineLimit(2)
                        }
                    }
                }
                .navigationTitle("Feedback Assistant")
                .navigationDestination(for: FeedbackReport.self, destination: EditReportView.init)
                .toolbar {
                    Button("New report", systemImage: "plus", action: createNew)
                }
            }
        }

        func createNew() {
            let report = FeedbackReport(title: "", content: "", priority: 1)
            modelContext.insert(report)
            navigationPath = [report]
        }
    }
}

extension UTType {
    static var feedbackReport = UTType(exportedAs: "com.kmnemon.feedbackreport")
}
