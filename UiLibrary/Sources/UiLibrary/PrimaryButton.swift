//
//  PrimaryButton.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 16/10/2023.
//

import SwiftUI

//TODO:  this is to error view implement

struct PrimaryButton<Label>: View where Label: View {
   private let buttonWidth: CGFloat = 240
   
   var isDisabled: Bool = false
   let label: () -> Label
   var action: (() -> Void)?
   
   var body: some View {
       Button(
           action: {
               action?()
           }, label: label
       )
       .buttonStyle(PrimaryButtonStyle())
       .id("button")
       .disabled(isDisabled)
       .frame(width: buttonWidth, height: 50)
   }
}

struct PrimaryButtonStyle: ButtonStyle {
   func makeBody(configuration: Configuration) -> some View {
       configuration.label
           .padding()
           .background(Color(red: 0, green: 0, blue: 0.2))
           .foregroundColor(.white)
           .clipShape(Capsule())
   }
}
