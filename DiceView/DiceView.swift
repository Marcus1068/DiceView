//
//  ContentView.swift
//  DiceView
//
//  Created by Marcus Deuß on 12.12.23.
//

import SwiftUI
import SwiftData

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    @Binding var numberOfAll: Int

    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
                // The .fit content mode means that if the image doesn’t have the same aspect ratio as the available space, it will shrink to the smaller axis and leave empty space on the other.
            
            Button("Roll"){
                withAnimation{
                    numberOfPips = Int.random(in: 1...6)
                    numberOfAll += numberOfPips
                    print(numberOfAll)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

/*#Preview {
    DiceView(numberOfAll: )
        //.modelContainer(for: Item.self, inMemory: true)
} */
