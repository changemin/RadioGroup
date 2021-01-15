//
//  CMRadioButtonGroup.swift
//
//
//  Created by 변경민 on 2021/01/14.
//

import SwiftUI

/// Radio Button Group Support Generic Type of Value for SwiftUI
public struct CMRadioButtonGroup<T>: View {
    @Binding var value: T
    @State var options: [CMRadioOption<T>]
    @State var selectedIdx: Int = 0
    var color: Color = Color(.sRGB, red: 50/255, green: 200/255, blue: 165/255)
    
    public var body: some View {
        VStack(alignment: .leading){
            ForEach(0..<options.count, id: \.self) { idx in
                CMRadioButton(selectedIdx: self.$selectedIdx, idx: idx, option: options[idx], value: $value, color: color)
            }
        }
    }
    
    public init(options: [CMRadioOption<T>], value: Binding<T>) {
        self._options = .init(initialValue: options)
        self._value = value
    }
    
    public init(options: [CMRadioOption<T>], value: Binding<T>, idx: Int) {
        self._options = .init(initialValue: options)
        self._value = value
        self.selectedIdx = idx
    }
    
    public init(options: [CMRadioOption<T>], value: Binding<T>, idx: Int, color: Color) {
        self._options = .init(initialValue: options)
        self._value = value
        self.selectedIdx = idx
        self.color = color
    }
}

public extension CMRadioButtonGroup {
    /// Change accent color of the radio buttons
    func accentColor(_ color: Color) -> CMRadioButtonGroup {
        CMRadioButtonGroup(options: self.options,
                           value: self.$value,
                           idx: self.selectedIdx,
                           color: color)
    }
}

