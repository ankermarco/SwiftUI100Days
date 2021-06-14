//
//  ContentView.swift
//  BetterRest
//
//  Created by Ke Ma on 06/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                }
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep").font(.headline)
                    Stepper(value: $sleepAmount, in: 4...12) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(message(from: calculateBedtime()))")
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                                    Button("Calculate") {
                                        alert(from: calculateBedtime())
                                    }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func calculateBedtime() -> Date? {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        showingAlert = true
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            return wakeUp - prediction.actualSleep
        } catch {
            return nil
        }
    }
    
    func alert(from sleepTime: Date?) {
        guard let sleepTime = sleepTime else {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            return
        }
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        alertMessage = formatter.string(from: sleepTime)
        alertTitle = "Your ideal bedtime is…"
    }
    
    func message(from sleepTime: Date?) -> String {
        
        guard let sleepTime = sleepTime else {
            return "Sorry, there was a problem calculating your bedtime."
        }
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return "Your ideal bedtime is \(formatter.string(from: sleepTime))"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
