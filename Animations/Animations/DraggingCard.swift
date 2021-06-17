//
//  DraggingCard.swift
//  Animations
//
//  Created by Ke Ma on 16/06/2021.
//

import SwiftUI

struct DraggingCard: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Drag the card to see animation")
                .font(.title)
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing).frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("4141 5678 3290 1414")
                    .font(.system(size: 24, weight: .regular, design: .monospaced))
                    .foregroundColor(.white)
            }
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation}
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            self.dragAmount = .zero
                        }
                    }
            )
            Spacer()
        }
    }
}

struct DraggingCard_Previews: PreviewProvider {
    static var previews: some View {
        DraggingCard()
    }
}
