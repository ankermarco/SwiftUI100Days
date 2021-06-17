//
//  ExplicitAnimation.swift
//  Animations
//
//  Created by Ke Ma on 16/06/2021.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var animationDegree = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation { //explicit animation
                self.animationDegree += 360
            }
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(animationDegree),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

struct ExplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimation()
    }
}
