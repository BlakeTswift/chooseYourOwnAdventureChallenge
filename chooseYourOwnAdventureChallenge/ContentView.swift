//
//  ContentView.swift
//  chooseYourOwnAdventureChallenge
//
//  Created by Trytten, Blake - Student on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State public var BirthDate = ""
    @State public var isBirthday = true
    
    @State public var Icing = "None"
    
    @State public var Sparklers = false
    
    @State public var Toppings = "None"
    
    @State public var Fruit = "None"
    
    @State public var Plate = "Normal"
    
    var body: some View {
        NavigationView {
        ZStack {
            Image("cakeStart")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .frame(width: .infinity, height: .infinity)
                .blur(radius: 30)
            Rectangle()
                .fill(Color.yellow)
                .ignoresSafeArea(edges: .all)
                .frame(width: 360, height: .infinity)
            VStack {
                Text("Bake Your Own Cake!")
                    .font(.system(size: 65, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                if BirthDate != "" {
                    
                    
                    NavigationLink("Start Baking?"){
                        
                        IcingView(Icing: $Icing, Toppings: $Toppings,Sparklers: $Sparklers)
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    .foregroundStyle(.black)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.green))
                    .font(.system(size: 40, weight: .medium, design: .serif))
                }
                Spacer()
                TextField("Birthdate?", text: $BirthDate)
                    .padding(.horizontal,50)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 40, weight: .medium, design: .serif))
                Spacer()
            }
            }
        }
    }
}

#Preview {
    ContentView()
}
