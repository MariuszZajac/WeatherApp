//
//  ClockView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//

import SwiftUI
 
   public struct ClockView: View {
        @State private var currentTime = Date()
       
       public init() {}
       
       public var body: some View {
            if #available(iOS 16.1, *) {
                return clockBody
            } else {
                return Text("Minimum iOS 16.1 required")
            }
        }
        
        @available(iOS 16.1, *)
        var clockBody: some View {
            Text(" \(formattedTime)")
                .fontWeight(.bold)
                .font(.system(size: 16))
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
