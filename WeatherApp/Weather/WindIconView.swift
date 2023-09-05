//
//  WindIconView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 01/09/2023.
//

import SwiftUI

struct WindIconView: View {
    var wind: WeatherData.Wind = WeatherData.Wind(speed: 0, deg: 0, gust: 0)

    var body: some View {
        let icon = getWindIcon(from: wind)
        switch icon {
        case .lightNorth, .moderateNorth, .strongNorth:
            Image(systemName: "arrow.up")
        case .lightEast, .moderateEast, .strongEast:
            Image(systemName: "arrow.right")
        case .lightSouth, .moderateSouth, .strongSouth:
            Image(systemName: "arrow.down")
        case .lightWest, .moderateWest, .strongWest:
            Image(systemName: "arrow.left")
        }
    }
}
struct WindIconView_Previews: PreviewProvider {
    static var previews: some View {
        WindIconView(wind: WeatherData.Wind(speed: 10, deg: 45, gust: 12))
    }
}
