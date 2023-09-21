//
//  MainDayView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 07/09/2023.
//

import SwiftUI

struct MainDayView: View {
    
    @StateObject var viewModel: MainDayViewModel
    
    var body: some View {
        VStack(spacing: 5) {
            Text(viewModel.dayString)
            Text("")
                .font(.subheadline)
                .foregroundColor(.white)
            Image(systemName: viewModel.weatherIcon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text( "\(30)°")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.primary)
        }
        
    }
    func getDayOfWeek(from data: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        guard let date = dateFormatter.date(from: data) else {
            return nil
        }
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date).uppercased()
    }
}

