//
//  TransferContext.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-transfer-an-object-between-a-background-context-and-the-main-context

/*
 All instances of your model objects are automatically bound to the actor where they are created, which means you can't bounce objects between your main context and a context running on a separate actor. Instead, you should pass your object's persistent identifier between your actors, then load them locally.

 Important: Although we're now more than two years into Swift concurrency, Xcode still ships with its concurrency checking option set to Minimal. At the time of writing this means you can send model objects between actors despite this potentially causing data races, and it will cause a hard error once Xcode starts to enforce its concurrency checks. If you'd like to save yourself some headaches, I'd suggest you go to your target's build settings and set Strict Concurrency Checking to Complete, then follow the instructions below in order to get concurrency right.

 As an example, let's say you're building an app that is able to scour various sources for information on a particular topic, and bring them all together in a local SwiftData store so you could perform various analysis work on it – perhaps you're running through some machine learning algorithms, you're performing semantic analysis, or whatever.
 */

import SwiftData
import SwiftUI

struct TransferContext {
    @Model
    class Topic {
        var name: String
        var content: String

        init(name: String, content: String = "") {
            self.name = name
            self.content = content
        }
    }
    
    //The Wrong Way: Do not write an actor that accepts a model object directly.
    //So, this code can introduce all sorts of problems in your code
    //don't do this!!!! - do not send model objects across actors.
    actor TopicResearcherWrong {
        func research(_ topic: Topic) async throws {
            print("Researching \(topic.name)…")
            // Lots of work here…
        }
    }
    
    /*
     There are only two things that are safe to send between actors:
     a ModelContainer and a PersistentIdentifier. This means the safe way to pass data between actors is to:

     1. Pass a model container instance from your main actor to another actor.
     2. Use that to create a model context on the other actor.
     3. Pass the persistent identifier of your model object from your main actor to the other actor.
     4. Use that to load the object on the other actor.
     */
    actor TopicResearcher {
        let context: ModelContext
        
        /*
         Tip: Remember, your object's persistent identifier is only temporary until it is saved for the first time. If you intend to make an actor do extensive work with its model context, it's much more efficient to create the context inside a method rather than accessing the actor's property.
         */
        var container: ModelContainer

        // Create a model context on this actor
        init(container: ModelContainer) {
            self.context = ModelContext(container)
            self.container = container
        }

        // Convert an identifier to a topic using the local context
        func research(_ identifier: PersistentIdentifier) async throws {
            guard let topic = context.model(for: identifier) as? Topic else {
                return
            }

            print("Researching \(topic.name)…")
            print("Lots of work here…")
        }
        
        /*
         Tip: Remember, your object's persistent identifier is only temporary until it is saved for the first time. If you intend to make an actor do extensive work with its model context, it's much more efficient to create the context inside a method rather than accessing the actor's property.
         */
        func research2(_ identifier: PersistentIdentifier) async throws {
            let context = ModelContext(container)
            guard let topic = context.model(for: identifier) as? Topic else {
                return
            }

            print("Researching \(topic.name)…")
            print("Lots of work here…")
        }
    }
    
    //apply with swiftUI
    struct ContentView: View {
        @Query(sort: \Topic.name) var topics: [Topic]
        @Environment(\.modelContext) var modelContext

        @State private var researcher: TopicResearcher

        var body: some View {
            NavigationStack {
                List(topics) { topic in
                    VStack(alignment: .leading) {
                        Text(topic.name)
                    }
                    .swipeActions {
                        Button("Research", systemImage: "magnifyingglass") {
                            research(topic)
                        }
                    }
                }
                .navigationTitle("AutoResearcher")
                .toolbar {
                    Button("Add Sample", action: addSample)
                }
            }
        }

        init(container: ModelContainer) {
            let researcher = TopicResearcher(container: container)
            _researcher = State(initialValue: researcher)
        }

        func addSample() {
            let topic1 = Topic(name: "The Roman Empire")
            let topic2 = Topic(name: "Travis Kelce")
            modelContext.insert(topic1)
            modelContext.insert(topic2)
        }

        func research(_ topic: Topic) {
            let id = topic.id

            /*
             [researcher] is a shorthand for capturing researcher inside the closure.
             It ensures that researcher is available for use in the closure, even if researcher was declared outside the closure.
             You can control how it is captured (strong, weak, or unowned) based on the memory management needs.
             [weak researcher],[unowned researcher]
             */
            Task { [researcher] in
                try await researcher.research(id)
            }
        }
    }
    
    
}
