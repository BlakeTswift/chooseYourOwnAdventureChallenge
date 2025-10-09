//
//  FruitView.swift
//  chooseYourOwnAdventureChallenge
//
//  Created by Trytten, Blake - Student on 10/6/25.
//

import SwiftUI

struct FruitView: View {
    
    @Binding var Icing: String
    @Binding var Toppings: String
    @Binding var Sparklers: Bool
    @Binding var Fruit: String
    @Binding var Birthdate: String
    @Binding var isBirthday: Bool
    @Binding var Plate: String
    
    @State var R3: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Rectangle().fill(LinearGradient(colors: [.red, .yellow, .blue,.purple], startPoint: .topLeading, endPoint: .bottom))
                    .frame(width: .infinity, height: 600)
                    .ignoresSafeArea(edges: .all)
                    .offset(y: -100)
                
                Rectangle().fill(.bar)
                    .frame(width: 350, height: 250)
                    .border(Color.black, width: 3)
                    .ignoresSafeArea(edges: .all)
                    .offset(y: -150)
                
                Rectangle().fill(.bar)
                    .frame(width: 350, height: 100)
                    .border(Color.black, width: 3)
                    .ignoresSafeArea(edges: .all)
                    .offset(y: 50)
                
                Rectangle().fill(.bar)
                    .frame(width: .infinity, height: 300)
                    .border(Color.black, width: 3)
                    .ignoresSafeArea(edges: .all)
                    .offset(y: 280)
                
                Text("?")
                    .font(.system(size: 90, weight: .bold))
                    .foregroundColor(.red)
                    .animation(.easeInOut(duration: 2))
                    .rotationEffect(Angle(degrees: R3 ? 45 : -45))
                    .animation(.linear(duration: 0.5).repeatForever(autoreverses: true), value: R3)
                    .onAppear {
                        R3 = true
                    }
                    .offset(x: -150,y: 350)
                
                NavigationLink("HOME") {
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                }
                .background(Circle().fill(.black).frame(width: 75, height: 75))
                .font(.system(size: 20, weight: .medium, design: .serif))
                .foregroundStyle(.white)
                .offset(x: 150,y: 375)
                VStack{
                    Text("What Fruit would you like?")
                        .font(.system(size: 35, weight: .medium, design: .serif))
                        .foregroundStyle(.black)
                        .frame(width: 300, height: 200)
                        .multilineTextAlignment(.center)
                        .offset(y:-100)
                    
                    Text("Current Selection: \(Fruit)")
                        .font(.system(size: 23, weight: .medium, design: .serif))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                    
                    ZStack {
                        Button("None") {
                            Fruit = "None"
                            
                        }
                        .font(.system(size: 40, weight: .medium, design: .serif))
                        .foregroundStyle(.white)
                        
                        .buttonStyle(.borderedProminent)
                        .offset(x: 110, y: 100)
                        
                        Button("Cherrys") {
                            Fruit = "Cherrys"
                            
                        }
                        .font(.system(size: 40, weight: .medium, design: .serif))
                        .foregroundStyle(.white)
                        .buttonStyle(.borderedProminent)
                        .offset(x: -90, y: 100)
                        
                        
                        Button("StrawBerrys") {
                            Fruit = "Strawberrys"
                            
                        }
                        .font(.system(size: 30, weight: .medium, design: .serif))
                        .foregroundStyle(.white)
                        .buttonStyle(.borderedProminent)
                        .offset(y: 200)
                        
                        NavigationLink(destination: BirthdayView(Icing: $Icing, Toppings: $Toppings, Sparklers: $Sparklers, Fruit: $Fruit,Birthdate: $Birthdate,isBirthday: $isBirthday, Plate: $Plate)
                            .navigationBarBackButtonHidden(true), label: {
                                
                                Text("Next")
                                Image(systemName: "arrowshape.right.fill")
                            })
                        .font(.system(size: 40, weight: .medium, design: .serif))
                        .foregroundStyle(.white)
                        .background(.green)
                        .cornerRadius(15)
                        .offset (x:100,y:-450)
                    }
                }
            }
        }
    }
}
//#Preview {
//    @Previewable @State var Fruit = "None"
//    
//    FruitView(Fruit: $Fruit)
//}
