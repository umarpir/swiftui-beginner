//
//  ContentView.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var colourToggle = true
    var body: some View {
        VStack{
            Link(destination: URL(string: "https://github.com/umarpir/swiftui-beginner")!) {
                Image("Bally_logo.svg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button("Learner App"){
                colourToggle.toggle()
            }
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(colourToggle ? Color(red: 1.0, green: 0, blue: 0) : Color(red: .random(in: 0...1) , green: .random(in: 0...1), blue:  .random(in: 0...1)))
                .multilineTextAlignment(.center)
            
                
        }
        .padding(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
