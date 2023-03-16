//
//  ContentView.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors:[ .red, .white]), startPoint: .top, endPoint: .bottom) .ignoresSafeArea()
            VStack(spacing: 30) {
                HStack{
                    
                    Image("Bally_logo.svg")
                        .resizable()
                        .frame(width: 170, height: 80)
                    Text("Guess the flag")
                        .foregroundColor(.red)
                        .font(.title.weight(.bold))
                        .fontDesign(.default)
                    
                }
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .fontDesign(.rounded)
                        .font(.title)
                    Text(countries[correctAnswer].capitalized)
                        .foregroundColor(.white)
                        .fontDesign(.rounded)
                        .font(.title.weight(.bold))
                    
                }
                
                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
                
            }
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("continue", action: askQuestion)
        } message: {
            Text("Your score is \(currentScore)")
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "correct"
            currentScore += 1
        } else{
            scoreTitle = "wrong"
            currentScore = 0
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
