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
    @FocusState private var amountIsFocused: Bool

    let tipPercentages  = [0,0.1,0.125,0.15,0.2,0.25]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage * 100)
        let tipvalue = checkAmount / 100 * tipSelection
        let grandTotal =  checkAmount + tipvalue
        let pricePerPerson = grandTotal / peopleCount
        return pricePerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people").tag($0)
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section{
                    Picker("Tip/service charge %: ", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            //let doublestr = String(format: "%.1f", tipPercentages[$0])
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Tip/Service charge")
                }
                
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Price Per Person")
                }
            }
            .navigationTitle("WeSplit App")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
