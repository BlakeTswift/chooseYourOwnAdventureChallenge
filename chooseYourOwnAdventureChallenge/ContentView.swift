//
//  ContentView.swift
//  chooseYourOwnAdventureChallenge
//
//  Created by Trytten, Blake - Student on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State public var Birthdate = ""
    @State public var isBirthday = true
    
    @State public var Icing = ""
    
    @State public var Sparklers = false
    
    @State public var Toppings = ""
    
    @State public var Fruit = ""
    
    @State public var Plate = ""
    
    @State public var Next = false
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("cakeStart")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(edges: .all)
                    .blur(radius: 30)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 360, height: .infinity)
                    .ignoresSafeArea(edges: .all)
                VStack {
                    Text("Bake Your Own Cake!")
                        .font(.system(size: 65, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    
                    
                    
                    
                    
                    NavigationLink("Start Baking?")
                    {
                        IcingView(Icing: $Icing, Toppings: $Toppings,Sparklers: $Sparklers, Fruit: $Fruit,Birthdate: $Birthdate,isBirthday: $isBirthday,Plate: $Plate)
                            .navigationBarBackButtonHidden(true)
                        
                    }
                    .foregroundStyle(.black)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.green))
                    .font(.system(size: 40, weight: .medium, design: .serif))
                    .opacity(Birthdate.isEmpty ? 0 : 1)
                    .animation(.easeInOut, value: Birthdate)
                    
                    
                    
                    
                    
                    Spacer()
                    Text("Do you know the secret code?\nsee at the end!")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .medium, design: .serif))
                    TextField("Example", text: $Birthdate)
                        .padding(.horizontal,50)
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 40, weight: .medium, design: .serif))
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                }
            }
        }
    }
    
    
}
extension AnyTransition {
    
    
    static var ScaleandOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x:-600))
    }
    
    
}
#Preview {
    ContentView()
}
