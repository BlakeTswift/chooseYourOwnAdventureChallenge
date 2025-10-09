//
//  ResultView.swift
//  chooseYourOwnAdventureChallenge
//
//  Created by Trytten, Blake - Student on 10/7/25.
//

import AVFoundation

class soundManager {
    static var shared = soundManager()
    private var soundEffectPlayer: AVAudioPlayer?
    
    func playImportedSound(named soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension:".mp3") {
            do {
                soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
                soundEffectPlayer?.play()
            } catch {
                print ("error playing sound \(error.localizedDescription)")
            }
        } else {
            print ("Sound file not found \(soundName)")
        }

    }
}





import SwiftUI

struct ResultView: View {
    @State var starSpin = false
    
    @Binding var Icing: String
    @Binding var Toppings: String
    @Binding var Sparklers: Bool
    @Binding var Fruit: String
    @Binding var Birthdate: String
    @Binding var isBirthday: Bool
    @Binding var Plate: String
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Image("conffeti")
                    .resizable()
                    .frame(width: .infinity, height: 400)
                    .ignoresSafeArea(edges: .all)
                    .offset(y: -200)
                
                Rectangle().fill(LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom))
                    .frame(width: .infinity, height: 575)
                    .border(Color.yellow, width: 3)
                    .ignoresSafeArea(edges: .all)
                    .offset(y: 200)
                Text("Wow\nYour cake looks like is make of \n")
                    .font(.system(size: 40, weight: .black, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.yellow.opacity(0.7))
                    .offset(x: 0, y: -250)
                Text("GOLD")
                    .font(.system(size: 50, weight: .black, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -180)
                
                
                Image(systemName: "star.fill")
                    .font(.system(size: 250, weight: .black, design: .serif))
                    .foregroundColor(.yellow)
                    .opacity(0.8)
                
                
                    .rotationEffect(Angle(degrees: starSpin ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: starSpin)
                    .onAppear {
                        starSpin = true
                        soundManager.shared.playImportedSound(named: "crowd-cheer-406646")
                            
                    }
                    .offset(x: 0, y: 75)
                NavigationLink("Go \nAgain?") {
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                }
                .background(Circle().fill(.green).frame(width: 125, height: 125))
                .font(.system(size: 30, weight: .heavy, design: .serif))
                .foregroundStyle(.white)
                .offset(x: 0,y: 300)
                
                ZStack {
                    if Birthdate != "Gold" {
                        Image(Plate)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .offset(y: 150)
                        Image(Icing)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .offset(y: 100)
                        Image(Toppings)
                            .resizable()
                            .frame(width: 100, height: 120)
                            .offset(y: -10)
                        Image(Fruit)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(y: 100)
                        Image(Fruit)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:50,y: 100)
                        Image(Fruit)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:-50,y: 100)
                        
                        Image("Happybirthday")
                            .resizable()
                            .frame(width: 150, height: 40)
                            .offset(y: 50)
                            .opacity(Birthdate != "" ? 1 : 0)
                    }
                    else if Birthdate == "Gold"
                    {
                        Image("Gold")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(y: 100)
                        Text("Gold Birthday Cake!")
                            .font(.system(size: 50, weight: .heavy, design: .serif))
                            .padding(.bottom)
                    }
                }
                
                
            }
        }
    }
    
    
    
}
#Preview {
    @Previewable @State var Icing = ""
    @Previewable @State var Toppings = ""
    @Previewable @State var Sparklers = false
    @Previewable @State var Fruit = ""
    @Previewable @State var Birthdate = ""
    @Previewable @State var isBirthday = false
    @Previewable @State var Plate = ""
    
    
    
    
    ResultView(Icing: $Icing, Toppings: $Toppings, Sparklers: $Sparklers, Fruit: $Fruit, Birthdate: $Birthdate, isBirthday: $isBirthday, Plate: $Plate)
}
