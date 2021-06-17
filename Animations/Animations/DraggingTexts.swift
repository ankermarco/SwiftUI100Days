//
//  DraggingTexts.swift
//  Animations
//
//  Created by Ke Ma on 16/06/2021.
//

import SwiftUI

struct DraggingTexts: View {
    let letters = Array("Hello SwiftUI")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? Color.blue : Color.red)
                    .offset(dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }.gesture(
            DragGesture()
                .onChanged{ self.dragAmount = $0.translation}
                .onEnded{ _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct DraggingTexts_Previews: PreviewProvider {
    static var previews: some View {
        DraggingTexts()
    }
}
