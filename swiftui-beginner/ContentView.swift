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
        Form{
            ForEach(0..<100){
                Text("row \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
