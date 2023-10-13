//
//  ClockView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//

import SwiftUI

struct ClockView: View {
    @State private var currentTime = Date()

    var body: some View {
        Text(" \(formattedTime)")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .onAppear {
                startClock()
            }
    }

    private var formattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: currentTime)
    }

    private func startClock() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            currentTime = Date()
        }
    }
}
