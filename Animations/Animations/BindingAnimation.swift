//
//  BindingAnimation.swift
//  Animations
//
//  Created by Ke Ma on 16/06/2021.
//

import SwiftUI

struct BindingAnimation: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        List {
            Stepper("Scale amount",
                    value: $animationAmount.animation(
                        Animation.easeInOut(duration: 1)
                            .repeatCount(3, autoreverses: true)),
                    in: 1...10)
            
            Button("Tap Me 2") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct BindingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimation()
    }
}
