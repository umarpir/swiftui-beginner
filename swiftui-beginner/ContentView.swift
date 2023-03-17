//
//  ContentView.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Link(destination: URL(string: "https://github.com/umarpir/swiftui-beginner")!) {
                Image("Bally_logo.svg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text("Learner App")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 1.0, green: 0, blue: 0))
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
