//
//  SplashView.swift
//  DiceView
//
//  Created by Marcus Deuß on 15.12.23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack{
            if self.isActive{
                ContentView()
            }
            else{
                Rectangle()
                    .background(Color.black)
                    .cornerRadius(8)
                Image("Splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width:300, height: 300)
                    .cornerRadius(8)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
