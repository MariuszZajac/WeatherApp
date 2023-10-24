//
//  WidgetWeatherAppLiveActivity.swift
//  WidgetWeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetWeatherAppAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetWeatherAppLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetWeatherAppAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetWeatherAppAttributes {
    fileprivate static var preview: WidgetWeatherAppAttributes {
        WidgetWeatherAppAttributes(name: "World")
    }
}

extension WidgetWeatherAppAttributes.ContentState {
    fileprivate static var smiley: WidgetWeatherAppAttributes.ContentState {
        WidgetWeatherAppAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetWeatherAppAttributes.ContentState {
         WidgetWeatherAppAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetWeatherAppAttributes.preview) {
   WidgetWeatherAppLiveActivity()
} contentStates: {
    WidgetWeatherAppAttributes.ContentState.smiley
    WidgetWeatherAppAttributes.ContentState.starEyes
}
