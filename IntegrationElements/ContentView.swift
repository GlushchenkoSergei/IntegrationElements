//
//  ContentView.swift
//  IntegrationElements
//
//  Created by mac on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Float = 50.0
    @State private var showAlert = false
   
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .font(.footnote)

            HStack {
                Text("0")
                UISliderFromUIKit(currentValue: $currentValue, alfa: computeScore())
                Text("100")
            }
            
            Button("Проверь меня!") { showAlert.toggle() }
            .alert("Попадание \(computeScore())%", isPresented: $showAlert) {}
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 50.0
            }
        }
        .padding()
    }
}

extension ContentView {
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
