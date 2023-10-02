//
//  Blur.swift
//  WeatherMegaAnimation
//
//  Created by Mariusz Zając on 22/09/2023.
//

import SwiftUI

class UIBackdropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}
struct Backdrop: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIBackdropView {
        UIBackdropView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct Blur: View {
    var radius: CGFloat = 3
    var opaque: Bool = false
    var body: some View {
      Backdrop()
            .blur(radius: radius, opaque: opaque)
    }
}

#Preview {
    Blur()
}
