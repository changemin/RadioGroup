//
//  CMRadioButtonGroup.swift
//
//
//  Created by 변경민 on 2021/01/14.
//

import SwiftUI

public struct CMRadioButtonGroup<T>: View {
    @Binding var value: T
    @State var options: [CMRadioOption<T>]
    @State var idx: Int = 0
    var color: Color = Color(.sRGB, red: 50/255, green: 200/255, blue: 165/255)
    
    public var body: some View {
        VStack(alignment: .leading){
            ForEach(0..<options.count, id: \.self) { idx in
                CMRadioButton(idx: self.$idx, option: options[idx], value: $value, color: color)
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
        self.idx = idx
    }
}


