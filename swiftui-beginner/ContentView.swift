//
//  ContentView.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 06/03/2023.
//

import SwiftUI


class User: ObservableObject{
   @Published  var firstName = ""
   @Published  var lastName = ""
}

struct Euser: Codable{
    var name: String
    var age: Int
}

struct SecondView: View{
    var tapCount: Int
    @Environment(\.dismiss) var dismiss
    var body: some View{
        VStack {
            Text("second view")
                .font(.largeTitle)
            
            Text("TAP-COUNT: \(tapCount)")
                .font(.largeTitle)
                .foregroundColor(Color.red)
            
            Button("Dismiss"){
                dismiss()
            }
            .padding(.top)
            .font(.headline)
        }
    }
}
struct ContentView: View {
    @State private var colourToggle = true
    @StateObject var user = User()
    @State private var showingView = false
    @AppStorage("tapCount") var tapCount = 0
    
    @State private var euser = Euser(name: "umar", age: 24)
    
    var body: some View {
        VStack{
            Link(destination: URL(string: "https://github.com/umarpir/swiftui-beginner")!) {
                Image("Bally_logo.svg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button("Learner App"){
                colourToggle.toggle()
                showingView.toggle()
                tapCount += 1
                
            } .font(.largeTitle)
                .fontWeight(.heavy)
            
            Button("save user"){
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(euser){
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            
            .foregroundColor(Color.blue)
                .padding(.vertical)
            .sheet(isPresented: $showingView){
                SecondView(tapCount: tapCount)
            }
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(colourToggle ? Color(red: 1.0, green: 0, blue: 0) : Color(red: .random(in: 0...1) , green: .random(in: 0...1), blue:  .random(in: 0...1)))
                .multilineTextAlignment(.center)
            
            VStack {
                Text("First name: \(user.firstName)")
                Text("Last name: \(user.lastName)")
            }
            .foregroundColor(Color.red)
            Spacer()
            HStack {
                TextField("Enter First Name", text: $user.firstName)
                TextField("Enter Last Name", text: $user.lastName)
            } .foregroundColor(Color.red)
            Spacer()
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
