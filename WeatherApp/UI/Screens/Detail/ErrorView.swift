//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 16/10/2023.
//

import SwiftUI

public struct ErrorView: View {
    var title: String
    @Environment(\.presentationMode) var presentationMode
    
    
    public var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.primary)
                    .multilineTextAlignment(.center)
            }
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }
                   , label: {
                Text("Dismiss")
                    .padding(.all, 8)
                    .frame(maxWidth: .infinity, alignment: .center)
            })
        }
        .padding(.horizontal, 48)
        
    }
}


