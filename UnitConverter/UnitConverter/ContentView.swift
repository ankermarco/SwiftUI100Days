//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ke Ma on 15/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State var from: String = ""
    @State var fromUnit = 5
    @State var toUnit = 1
    @State var fromUnits: [(String, UnitLength)] = [
        ("Meter", UnitLength.meters),
        ("KM", UnitLength.kilometers),
        ("FT", UnitLength.feet),
        ("IN", UnitLength.inches),
        ("YD", UnitLength.yards),
        ("Mile", UnitLength.miles)]
    
    var fromMeasure: Measurement<UnitLength> {
        Measurement(value: Double(from) ?? 0, unit: fromUnits[fromUnit].1)
    }
    
    var toMeasure: String {
        fromMeasure.converted(to: fromUnits[toUnit].1).description
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("from value")) {
                    TextField("From: ", text: $from)
                    Picker("Unit", selection: $fromUnit) {
                        ForEach(0 ..< fromUnits.count) {
                            Text("\(self.fromUnits[$0].0)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("to value")) {
                    Picker("Unit", selection: $toUnit) {
                        ForEach(0 ..< fromUnits.count) {
                            Text("\(self.fromUnits[$0].0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(toMeasure)")
                }
            }
            .navigationTitle("Length converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
