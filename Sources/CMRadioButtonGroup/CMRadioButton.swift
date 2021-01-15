//
//  CMRadioButton.swift
//  
//
//  Created by 변경민 on 2021/01/14.
//

import SwiftUI

/// Cool radio button group supports generic type of value
struct CMRadioButton<T>: View {
    @Binding var value: T
    @State var idx: Int
    @Binding var selectedIdx: Int
    var option: CMRadioOption<T>
    var size: CGFloat = 24
    var color: Color
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .strokeBorder(Color.gray,lineWidth: 1)
                    .frame(width: size, height: size)
                Circle()
                    .fill(color)
                    .frame(width: selectedIdx == idx ? size-8 : 0, height: selectedIdx == idx ? size-8 : 0)
            }
            Text("\(option.label)")
                .font(Font.system(size: 17, weight: .light, design: .rounded))
        }.contentShape(Rectangle())
        .onTapGesture {
            self.value = option.value
            withAnimation(.spring()) {
                self.selectedIdx = idx
            }
        }
    }
    
    init(selectedIdx: Binding<Int>, idx: Int, option: CMRadioOption<T>, value: Binding<T>, color: Color) {
        self._selectedIdx = selectedIdx
        self._idx = .init(initialValue: idx)
        self.option = option
        self._value = value
        self.color = color
    }
}

public struct CMRadioOption<T> {
    var label: String = ""
    var value: T
    
    public init(label: String, value: T) {
        self.label = label
        self.value = value
    }
}
