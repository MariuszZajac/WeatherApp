//
//  ErrorLogger.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 29/08/2023.
//
import Foundation

final class ErrorLogger {
    
    static let shared = ErrorLogger()
    
    private init() {}
    
    func logError(_ error: Error) {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let logFileUrl = documentsPath.appendingPathComponent("errorLog.txt")
        
        let dateString = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        let logString = "[\(dateString)] \(error.localizedDescription)\n"
        
        do {
            let fileHandle = try FileHandle(forWritingTo: logFileUrl)
            fileHandle.seekToEndOfFile()
            if let data = logString.data(using: .utf8) {
                fileHandle.write(data)
            }
            fileHandle.closeFile()
        } catch {
            do {
                try logString.write(to: logFileUrl, atomically: true, encoding: .utf8)
            } catch {
                print("Nie udało się zapisać błędu: \(error)")
            }
        }
    }
}
