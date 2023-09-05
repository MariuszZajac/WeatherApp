//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI
import CoreLocation
import Combine

final class CityViewModel: ObservableObject {
    @Published var city: [City] = []
    }
