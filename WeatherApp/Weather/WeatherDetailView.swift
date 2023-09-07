//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI
struct WeatherDetailView: View {
    var weatherData: [WeatherData]

    var body: some View {
        HStack {
            weatherParams()
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        // Pogoda dla każdej godziny
                        ForEach(weatherData, id: \.dt) { data in

                            let viewModel = WeatherHourViewModel(from: data)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(viewModel.hour)")
                                Text("\(viewModel.temp.roundDouble())°")
                                VStack {
                                    WindIconView(wind: viewModel.wind)
                                    Text("\(viewModel.wind.speed.roundDouble())m/s")
                                }
                                Text("\(viewModel.visibility)m")
                                Text("\(viewModel.pressure)hPa")
                                Text("\(viewModel.humidity)%")
                            }
                            .frame(width: geometry.size.width * 0.3)
                        }
                    }
                    .padding(2)
                }
            }
        }
    }
}
extension WeatherDetailView {
    @ViewBuilder func weatherParams() -> some View {
        VStack(alignment: .leading, spacing: 10) {
                Text("Godzina")
                Text("Temp")
                VStack {
                    Text("Wiatr")
                    Text(" ")
                }
                Text("Widoczność")
                Text("Ciśnienie")
                Text("Wilgotność")
            }
            .bold()
            .padding()
    }
}
