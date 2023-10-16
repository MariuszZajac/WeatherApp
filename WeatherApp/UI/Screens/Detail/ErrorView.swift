//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 16/10/2023.
//

import SwiftUI

public struct ErrorView: View {
        var title: String
        var buttonLabel: String = "Try again"
        let action: () -> Void

        public init(title: String,
                    buttonLabel: String = "Try again",
                    action: @escaping () -> Void) {
            self.title = title
            self.buttonLabel = buttonLabel
            self.action = action
        }

        public var body: some View {
            VStack(spacing: 48) {
                VStack(spacing: 8) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.primary)
                        .multilineTextAlignment(.center)
                        .id("error_title")
                }
                PrimaryButton(label: {
                    Text(buttonLabel)
                        .padding(.all, 8)
                        .frame(maxWidth: .infinity, alignment: .center)
                }, action: action)
            }
            .padding(.horizontal, 48)
            .id("error_view")
        }
    }


