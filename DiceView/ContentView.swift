//
//  ContentView.swift
//  DiceView
//
//  Created by Marcus Deuß on 12.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 1
    @State private var numberOffAll: Int = 0
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.self) { _ in
                    DiceView(numberOfAll: $numberOffAll)
                        .foregroundStyle(.white)
                }
            }
            
            HStack{
                Button("Remove Dice", systemImage: "minus.circle.fill"){
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill"){
                    numberOfDice += 1
                    
                }
                .disabled(numberOfDice == 5)
                
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
            
            Button("Reset"){
                numberOfDice = 1
                numberOffAll = 0
            }
            .buttonStyle(GrowingButton())
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.indigo)
        .tint(.white)
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.3 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
