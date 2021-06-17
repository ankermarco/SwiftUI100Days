//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ke Ma on 19/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var rotateDegree = 0.0
    @State private var correctFlag = false
    @State private var isNewGame = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of").foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        
                        self.flagTapped(number)
                    }, label: {
                        
                        if self.isNewGame {
                            FlagImage(country: self.countries[number])
                        } else {
                            if self.correctFlag {
                                if number == correctAnswer {
                                    withAnimation{
                                        FlagImage(country: self.countries[number])
                                            .rotation3DEffect(
                                            .degrees(rotateDegree),
                                            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                                            )
                                    }
                                } else {
                                    FlagImage(country: self.countries[number]).opacity(0.15)
                                }
                            } else {
                                FlagImage(country: self.countries[number])
                            }
                        }
                        
                    })
                }
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
            }
            Spacer()
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            isNewGame = false
            correctFlag = true
            
            withAnimation {
                rotateDegree += 360.0
            }
            
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            if score > 0 {
                score -= 1
            }
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        self.isNewGame = true
    }
}

struct FlagImage: View {
    var country: String
    var body: some View {
        Image(country)
            .renderingMode(.original).clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
