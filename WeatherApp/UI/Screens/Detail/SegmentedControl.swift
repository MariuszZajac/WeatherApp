//
//  SegmentedControl.swift
//  WeatherMegaAnimation
//
//  Created by Mariusz Zając on 22/09/2023.
//

import SwiftUI

struct SegmentedControl: View {
    @Binding var selection: WeatherViewModel.ForecastType
    var body: some View {
        VStack(spacing: 5) {
            //MARK: Segmented Buttons
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = .hour
                    }
                    
                } label: {
                    Text(" 48 hour Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                Button{
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = .week
                    }
                } label: {
                    Text("Weekly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .font(.headline.weight(.semibold))
            .foregroundColor(.secondary)
            
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
                .blendMode(.overlay)
                .overlay {
                    //MARK: Underline
                    VStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2.5 , height: 3)
                           .background(Color.white)
                        .blendMode(.overlay)
                    }
                    .frame(maxWidth: .infinity, alignment: selection == .hour ? .leading : .trailing)
                    .offset(y:-1)
                }
        }
        .padding(25)
    }
}

