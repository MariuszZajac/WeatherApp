//
//  WeatherDataUpdate.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import Foundation
//TODO: 
func saveUpdateTimeToUserDefaults() {
    let currentTime = Date()
    UserDefaults.standard.set(currentTime, forKey: "lastUpdateTime")
}

func updateDataIfNeeded() {
    // ?? cashe? what about this?
    if didDataNeedUpdate() {
        
    // update func
        saveUpdateTimeToUserDefaults()
    }
     else {
        // initial state fetch data
    }
    
   
    saveUpdateTimeToUserDefaults()
}
func didDataNeedUpdate() -> Bool {
    let currentTime = Date()
    
    if let lastUpdateTime = UserDefaults.standard.object(forKey: "lastUpdateTime") as? Date {
        let elapsedTime = currentTime.timeIntervalSince(lastUpdateTime)
        let desiredInterval = 3600
        
        return elapsedTime >= TimeInterval(desiredInterval)
    }
    
    return false
}
