//
//  ContentView.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        VStack{
            Text("Practice App")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Image("Bally_logo.svg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
