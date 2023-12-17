//
//  ContentView.swift
//  DiceView
//
//  Created by Marcus Deuß on 12.12.23.
//

import SwiftUI
import SwiftData

struct DiceView: View {
    //@Environment(\.modelContext) private var modelContext
    //@Query private var items: [Item]
    @State private var numberOfPips: Int = 1

    var body: some View {
        Image(systemName: "die.face.\(numberOfPips)")
            .resizable()
            .frame(width: 100, height: 100)
        
        Button("Roll"){
            withAnimation{
                numberOfPips = Int.random(in: 1...6)
            }
        }
        .buttonStyle(.bordered)
    }
    
}

#Preview {
    DiceView()
        //.modelContainer(for: Item.self, inMemory: true)
}
