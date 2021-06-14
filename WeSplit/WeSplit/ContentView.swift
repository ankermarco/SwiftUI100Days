//
//  ContentView.swift
//  WeSplit
//
//  Created by Ke Ma on 08/04/2021.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var numberOfPeople2 = "2"
    @State private var tipPercentage = 2
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = tipValue + orderAmount
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
//        let peopleCount = Double(numberOfPeople + 2)
//        let tipSelection = Double(tipPercentages[tipPercentage])
//        let orderAmount = Double(checkAmount) ?? 0
//
//        let tipValue = orderAmount / 100 * tipSelection
//        let grandTotal = tipValue + orderAmount
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    // When an @State property changes SwiftUI will reinvoke the body property
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                        TextField("Number of people", text: $numberOfPeople2).keyboardType(.decimalPad)
//                        Picker("Number of people", selection: $numberOfPeople) {
//                            ForEach(2 ..< 100) {
//                                Text("\($0) people")
//                            }
//                        }
                    }
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("Grand total")) {
                        Text("$\(grandTotal, specifier: "%.2f")").foregroundColor(self.tipPercentage == 4 ? .red: .black)
                    }
                    Section(header: Text("Amount per person")) {
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                    }
                }
                .navigationTitle("WeSplit")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
