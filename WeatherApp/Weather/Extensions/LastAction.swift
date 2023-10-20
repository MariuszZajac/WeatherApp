//
//  LastAction.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 19/10/2023.
//

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
