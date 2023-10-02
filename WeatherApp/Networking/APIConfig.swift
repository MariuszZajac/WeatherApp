//
//  APIConfig.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 29/08/2023.
//

import Foundation
struct APIConfig {
    static var baseURL: String {
        return value(for: "BaseURLNew")
    }

    static var apiKey: String {
        return value(for: "APIKey")
    }
    
    private static func value(for key: String) -> String {
        guard let path = Bundle.main.path(forResource: "APIConfig", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let configs = try? PropertyListDecoder().decode([String: String].self, from: xml),
              let value = configs[key] else {
            fatalError("Missing API configs")
        }
        return value
    }
}
