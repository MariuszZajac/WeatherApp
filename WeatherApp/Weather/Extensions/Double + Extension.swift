//
//  Double + Extension.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 18/10/2023.
//

import Foundation

extension Double {
  func roundDouble() -> String {
    return String(format: "%.1f", self)
  }
}
