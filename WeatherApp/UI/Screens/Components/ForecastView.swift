//
//  ForecastView.swift
//  WeatherMegaAnimation
//
//  Created by Mariusz Zając on 22/09/2023.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationPropted: CGFloat = 1
    @State private var selection = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                //MARK: Segmented Control
                //switch hourly to daily
                SegmentedControl(selection: $selection)
                
                //MARK: Forecast Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
//                        if selection == 0 {
//                            
//                            ForEach(hourlyForecast) { forecast in
//                            MainDayView(viewModel: MainDayViewModel(weatherItem: forecast))
//                            }
//                            .transition(.offset(x: -430))
//                        } else {
//                            ForEach(weeklyForecast.date) { forecast in
//                                MainDayView(viewModel: MainDayViewModel(weatherItem: forecast))
//                            }
//                            .transition(.offset(x: 430))
//                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                
                //MARK: Mock Data Widgets
                // to tylko foto
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationPropted)
            }
        }
      
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44),
                     color: Color.bottomSheetBorderMiddle,
                     lineWidth: 1,
                     offsetX: 0,
                     offsetY: 1,
                     blur: 0,
                     blendMode: .overlay,
                     opacity: 1 - bottomSheetTranslationPropted)
        .overlay{
            //MARK: bottom sheet separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    ForecastView()
        .background(Color.background)
        .preferredColorScheme(.dark)
}
