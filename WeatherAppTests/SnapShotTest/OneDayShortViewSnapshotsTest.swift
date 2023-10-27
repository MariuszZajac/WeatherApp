//
//  OneDayShortViewSnapshotsTest.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 27/10/2023.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import WeatherApp

class OneDayShortViewSnapshotsTest: XCTestCase {

  func testView() {
    //arrangeM
    let viewModel = OneDayShortViewModel(forecast: .make())
    let sut = OneDayShortView(viewModel: viewModel)
    //assert

    assertSnapshot(
      matching: sut,
      as: .image(layout: .device(config: .iPhone13)))

  }

}
