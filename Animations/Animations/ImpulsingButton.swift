//
//  ImpulsingButton.swift
//  Animations
//
//  Created by Ke Ma on 16/06/2021.
//

import SwiftUI

struct ImpulsingButton: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap me 1") {
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        
        .blur(radius: (animationAmount - 1) * 3)
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
            
        ).onAppear {
            self.animationAmount = 2
        }
    }
}

struct ImpulsingButton_Previews: PreviewProvider {
    static var previews: some View {
        ImpulsingButton()
    }
}
