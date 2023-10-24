//
//  WidgetWeatherAppBundle.swift
//  WidgetWeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import WidgetKit
import SwiftUI

@main
struct WidgetWeatherAppBundle: WidgetBundle {
    var body: some Widget {
        WidgetWeatherApp()
        WidgetWeatherAppLiveActivity()
    }
}
