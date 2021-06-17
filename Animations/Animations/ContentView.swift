//
//  ContentView.swift
//  Animations
//
//  Created by Ke Ma on 15/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var enabled = false
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink("Implicit animation", destination: ImpulsingButton())
                NavigationLink("Binding animation", destination: BindingAnimation())
                NavigationLink("Explicit animation", destination: ExplicitAnimation())
                NavigationLink("Dragging gesture animation", destination: DraggingCard())
                NavigationLink("Dragging gesture animation 2", destination: DraggingTexts())
                NavigationLink("Show hide view using transition", destination: ShowHideViewUsingTransition())
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
