//
//  LastAction.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 19/10/2023.
//

//TODO:
/// to error handling
import Foundation
class LastAction {
    var lastAction: () -> Void = {}
    
    func saveLastAction(action: @escaping () -> Void) {
        lastAction = action
    }
    func executeLastAction() {
        lastAction()
    }
}
