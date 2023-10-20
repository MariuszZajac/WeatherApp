//
//  WindIconView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 01/09/2023.
//

import SwiftUI

struct WindIconView: View {
    var wind: Wind
    var body: some View {
        let icon = WindIcon.getWindIcon(from: wind)
        switch icon {
        case .lightNorth, .moderateNorth, .strongNorth:
            Image(systemName: "arrowshape.up")
        case .lightEast, .moderateEast, .strongEast:
            Image(systemName: "arrowshape.right")
        case .lightSouth, .moderateSouth, .strongSouth:
            Image(systemName: "arrowshape.down")
        case .lightWest, .moderateWest, .strongWest:
            Image(systemName: "arrowshape.left")
        }
    }
    
}
