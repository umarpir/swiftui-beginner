//
//  ContentView.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.00
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0.0
    let tipPercentages  = [0,5,10,12.5,15,20,25]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    
                    Picker("Tip/service charge %: ", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            let doublestr = String(format: "%.1f", tipPercentages[$0])
                            Text("\(doublestr) %" ).tag($0)
                        }
                    }.pickerStyle(.navigationLink)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people").tag($0)
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                
                Section{
                    Text("Price Per Person")
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit App")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
