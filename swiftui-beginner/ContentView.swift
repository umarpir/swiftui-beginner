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
            Image("Bally_logo.svg")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Learner App")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
