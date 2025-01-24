//
//  WithWidget.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI

/*
 https://www.hackingwithswift.com/quick-start/swiftdata/how-to-access-a-swiftdata-container-from-widgets
 1. Go to your main app target's Signing & Capabilities, and add the App Groups capability.
 2. Click + and add a new group, or select one you made previously.
 3. Repeat steps 1 and 2 for your widget.
 4. Make sure whatever Swift files contain your SwiftData models have been added to both your app and widget targets.
 5. Add the modelContainer() modifier to your widget, e.g. in your StaticConfiguration or AppIntentConfiguration.
 */


/*
 One thing to be mindful of is that iOS limits how often widgets are refreshed, so you should explicitly ask for a widget refresh when you know something important has changed.

 To do that, first add an import for WidgetKit, then call this:
    WidgetCenter.shared.reloadAllTimelines()
 */
