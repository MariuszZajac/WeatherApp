//
//  WeatherDataCache.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 29/08/2023.
//

import Foundation
class WeatherDataCache {
    private let fileURL: URL

    init(fileName: String) {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.fileURL = documents.appendingPathComponent(fileName)
    }

    func saveWeatherData(_ data: WeatherData) {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase

        if let encodedData = try? encoder.encode(data) {
            try? encodedData.write(to: fileURL)
        }
    }

    func fetchWeatherData() -> WeatherData? {
        if let data = try? Data(contentsOf: fileURL) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try? decoder.decode(WeatherData.self, from: data)
        }
        return nil
    }

    func lastModifiedCacheDate() -> Date? {
        if let fileAttributes = try? FileManager.default.attributesOfItem(atPath: fileURL.path) as NSDictionary {
            return fileAttributes.fileModificationDate()
        }
            return nil
        }
    func timeSinceLastCacheModification() -> TimeInterval? {
        if let lastModifiedDate = lastModifiedCacheDate() {
            return Date().timeIntervalSince(lastModifiedDate)
        }
        return nil
    }
    func isCacheFresh() -> Bool {
        if let timeInterval = timeSinceLastCacheModification() {
            return timeInterval <= 1
        }
        return false
    }
}
