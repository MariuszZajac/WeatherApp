//
//  OneDayShortViewModel.test.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 13/10/2023.
//

import XCTest
import Foundation
@testable import WeatherApp

class OneDayShortViewModelTest: XCTestCase {
    
    func testProperties() {
        //arrange
        let sut = OneDayShortViewModel(forecast: .make())
        //assert
        XCTAssertEqual(sut.shortDayOfWeek, "Thu")
        XCTAssertEqual(sut.dayOfWeek, "Oct 05")
        XCTAssertEqual(sut.tempMax, 22.0)
        XCTAssertEqual(sut.tempMin, 12.0)
        XCTAssertEqual(sut.weatherIcon, .clearDay)
       
        
    }
    
}
