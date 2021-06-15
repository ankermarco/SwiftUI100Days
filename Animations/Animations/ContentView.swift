//
//  ContentView.swift
//  Animations
//
//  Created by Ke Ma on 15/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    @State private var animationDegree = 0.0
    var body: some View {
        List {
            Button("Tap me") {
                //            animationAmount += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            //        .scaleEffect(animationAmount)
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
            Stepper("Scale amount", value: $animationAmount.animation(Animation.easeInOut(duration: 1)
                                                                        .repeatCount(3, autoreverses: true)), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
            Spacer()
            
            Button("Tap Me") {
                
                
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(
                .degrees(animationDegree),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            ).onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.animationDegree += 360
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
