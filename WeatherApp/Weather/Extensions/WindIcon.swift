//
//  WindIcon.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 01/09/2023.
//

import Foundation

enum WindIcon {
    case lightNorth
    case moderateNorth
    case strongNorth
    case lightEast
    case moderateEast
    case strongEast
    case lightSouth
    case moderateSouth
    case strongSouth
    case lightWest
    case moderateWest
    case strongWest
}
extension WindIcon {
   static func getWindIcon(from wind: Wind) -> WindIcon {
        switch wind.windDeg {
        case 0..<45, 315..<360:
            return getIconForStrength(speed: wind.windSpeed, light: .lightNorth, moderate: .moderateNorth, strong: .strongNorth)
        case 45..<135:
            return getIconForStrength(speed:  wind.windSpeed, light: .lightEast, moderate: .moderateEast, strong: .strongEast)
        case 135..<225:
            return getIconForStrength(speed:  wind.windSpeed, light: .lightSouth, moderate: .moderateSouth, strong: .strongSouth)
        case 225..<315:
            return getIconForStrength(speed:  wind.windSpeed, light: .lightWest, moderate: .moderateWest, strong: .strongWest)
        default:
            return .lightNorth
        }
    }
    
   static func getIconForStrength(speed: Double, light: WindIcon, moderate: WindIcon, strong: WindIcon) -> WindIcon {
        if speed < 10 {
            return light
        } else if speed < 20 {
            return moderate
        } else {
            return strong
        }
    }
}
