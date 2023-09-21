//
//  DayDetailView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct DayDetailView: View {

    @StateObject var viewModel: DayDetailViewModel

    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
            VStack {

                Spacer()
                Text("\(String(format: "%.0f", viewModel.tempMax))")
                    .font(.title)
                    
                    .foregroundColor(.red)
//                Text("\(String(format: "%.0f", weatherData.main.tempMin ?? 0))")
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .padding()
//                Image(systemName: icon.systemImageName)
//                    .renderingMode(.original)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 80, height: 80)

                HStack(spacing: 5) {
                    Image(systemName: "wind")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)

//                    VStack {
//                        WindIconView(wind: weatherData.wind)

//                        Text("\(String(format: "%.1f", (weatherData.wind.speed)!)) m/s")
//                            .font(.title2)
//                            .foregroundColor(.green)
//                            .padding()
//                    }

                }
                Spacer()
                Button {

                } label: {
                    Text("Hourly Forecast")

                        .frame(width: 180, height: 40)
                        .background(Color(.label))
                        .foregroundColor(.red)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
            }
          //  TemperatureChart(temperatureChart: [TemperatureData]())
        }
        }
    }


//struct DayDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayDetailView(weatherData: [], icon: .clearDay)
//    }
//}
