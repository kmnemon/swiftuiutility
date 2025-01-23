//
//  Context.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/22.
//

import SwiftData
import SwiftUI

/*
 Important:
 1. ModelContext and
 2. all SwiftData models do not conform to Sendable, which means they can't be transferred between Swift actors.
 3. ModelContainer does conform to Sendable, so please use that to create your background context.
 https://www.hackingwithswift.com/quick-start/swiftdata/how-to-create-a-background-context
 */

struct Context {}

extension Context {
    class BackgroundDataHander {
        private var context: ModelContext

        init(with container: ModelContainer) {
            context = ModelContext(container)
        }
    }
}
