//
//  DayDetailView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct DayDetailView: View {

   var viewModel: DayDetailViewModel

    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
            VStack {

                Spacer()
                Text("\(String(format: "%.0f", viewModel.temp))")
                    .font(.title)
                    
                    .foregroundColor(.red)
               
                Image(systemName: viewModel.weatherIcon.systemImageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)

//                HStack(spacing: 5) {
//                    Image(systemName: "wind")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 60, height: 60)
//
//                    VStack {
//                        WindIconView(wind: viewModel.wind)
//
//                        Text("\(String(format: "%.1f", (viewModel.wind.windSpeed))) m/s")
//                            .font(.title2)
//                            .foregroundColor(.green)
//                            .padding()
//                    }
//
//                }
               
               
            }
            TemperatureChart(temperatureChart: [TemperatureData]())
        }
        }
    }


//struct DayDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayDetailView(viewModel: DayDetailViewModel(detailWeather: [HourlyWeather]()))
//    }
//}
