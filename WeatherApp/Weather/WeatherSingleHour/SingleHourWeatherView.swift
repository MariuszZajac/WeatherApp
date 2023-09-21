//
//  SingleHourWeatherView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 01/09/2023.
//

import SwiftUI

//struct SingleHourWeatherView: View {
//    var viewModel: WeatherHourViewModel
//    var body: some View {
//        ScrollView {
//            VStack {
//                headerSection
//                iconSection
//                infoSection
//            }
//            .padding()
//        }
//    }
//    var headerSection: some View {
//        Text("\(viewModel.hour)")
//            .font(.title)
//    }
//    var iconSection: some View {
//        HStack {
//            Image(systemName: viewModel.icon.systemImageName)
//                .font(.title2)
//                .frame(width: 5, height: 5)
//                .padding()
//        }.foregroundColor(Color.blue)
//    }
//    var infoSection: some View {
//        VStack {
//            Text("\(viewModel.temp.roundDouble())°")
//                .font(.largeTitle)
//            Text("Wiatr:")
//            WindIconView(wind: viewModel.wind)
//            Text("Widoczność:")
//            Text("\(viewModel.visibility)m")
//            Text("Ciśnienie:")
//            Text("\(viewModel.pressure) hPa")
//            Text("Wilgotność:")
//            Text("\(viewModel.humidity)%")
//        }
//    }
//}
