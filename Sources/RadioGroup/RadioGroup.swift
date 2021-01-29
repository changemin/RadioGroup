//
//  RadioButtonGroup.swift
//
//
//  Created by 변경민 on 2021/01/14.
//

import SwiftUI

/// Radio Group Support Generic Type of Value for SwiftUI
public struct RadioGroup<T>: View {
    @Binding var value: T
    @State var options: [RadioOption<T>]
    @State var selectedIdx: Int = 0
    var color: Color = Color(.sRGB, red: 50/255, green: 200/255, blue: 165/255)
    
    public var body: some View {
        VStack(alignment: .leading){
            ForEach(0..<options.count, id: \.self) { idx in
                RadioButton(selectedIdx: self.$selectedIdx, idx: idx, option: options[idx], value: $value, color: color)
            }
        }
    }
    
    public init(options: [RadioOption<T>], value: Binding<T>) {
        self._options = .init(initialValue: options)
        self._value = value
    }
    
    public init(options: [RadioOption<T>], value: Binding<T>, idx: Int) {
        self._options = .init(initialValue: options)
        self._value = value
        self.selectedIdx = idx
    }
    
    public init(options: [RadioOption<T>], value: Binding<T>, idx: Int, color: Color) {
        self._options = .init(initialValue: options)
        self._value = value
        self.selectedIdx = idx
        self.color = color
    }
}

public extension RadioGroup {
    /// Change accent color of the radio buttons
    func accentColor(_ color: Color) -> RadioGroup {
        RadioGroup(options: self.options,
                   value: self.$value,
                   idx: self.selectedIdx,
                   color: color)
    }
}

