//
//  UISliderFromUIKit.swift
//  IntegrationElements
//
//  Created by mac on 01.06.2022.
//

import SwiftUI

struct UISliderFromUIKit: UIViewRepresentable {
    
    @Binding var currentValue: Float
    let alfa: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100.0
        slider.minimumValue = 0.0
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeValue2),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue
        uiView.thumbTintColor = UIColor(red: 1,
                                      green: 0,
                                      blue: 0,
                                      alpha: CGFloat(Double(alfa) / 100.0))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UISliderFromUIKit {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
       
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func didChangeValue2(_ sender: UISlider) {
            currentValue = sender.value
        }
    }
}

struct UISliderFromUIKit_Previews: PreviewProvider {
    static var previews: some View {
        UISliderFromUIKit(currentValue: .constant(50.0), alfa: 1)
    }
}
