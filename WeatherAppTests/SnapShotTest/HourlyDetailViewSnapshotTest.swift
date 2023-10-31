//
//  HourlyDetailViewSnapshotTest.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 30/10/2023.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import WeatherApp

class HourlyDetailViewSnapshotTest: XCTestCase {

  func testView() {
    //arrangeM
    let viewModel = HourlyDetailViewModel(forecastHourly: .make())
      
    let sut = HourlyDetailView(viewModel: viewModel)
    //assert

    assertSnapshot(
      matching: sut,
      as: .image(layout: .device(config: .iPhone13)))

  }

}
