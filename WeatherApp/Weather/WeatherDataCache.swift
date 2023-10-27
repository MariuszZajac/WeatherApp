//
//  WeatherDataCache.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 29/08/2023.
//

import Foundation
protocol WeatherDataCacheProtocol {
    func saveWeatherData(_ data: WeatherData, fileName: String)
    func fetchWeatherData(fileName: String)-> WeatherData?
    func isCacheFresh(name: String) -> Bool
}
class WeatherDataCache: WeatherDataCacheProtocol {
    private let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    func saveWeatherData(_ data: WeatherData, fileName: String) {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        if let encodedData = try? encoder.encode(data), let url = getFileUrlForName(name: fileName) {
            try? encodedData.write(to: url)
        }
    }
    
    func fetchWeatherData(fileName: String) -> WeatherData? {
        if let url = getFileUrlForName(name: fileName), let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try? decoder.decode(WeatherData.self, from: data)
        }
        return nil
    }
    private func getFileUrlForName(name:String)-> URL? {
        if let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            return documents.appendingPathComponent(name) } else {
                return nil
            }
    }
    private func lastModifiedCacheDate(name: String) -> Date? {
        
        if let url = getFileUrlForName(name: name), let fileAttributes = try? fileManager.attributesOfItem(atPath: url.path) as NSDictionary  {
            return fileAttributes.fileModificationDate()
        }
        return nil
    }
    private func timeSinceLastCacheModification(name: String) -> TimeInterval? {
        if let lastModifiedDate = lastModifiedCacheDate(name: name) {
            return Date().timeIntervalSince(lastModifiedDate)
        }
        return nil
    }
    func isCacheFresh(name: String) -> Bool {
        if let timeInterval = timeSinceLastCacheModification(name: name) {
            return timeInterval <= 10
        }
        return false
    }
}
