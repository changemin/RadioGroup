import SwiftUI

public struct CMRadioButtonGroup<T>: View {
    @Binding var value: T
    @State var options: [CMRadioOption<T>]
    @State var idx: Int = 0
    
    public var body: some View {
        VStack {
            ForEach(0..<options.count, id: \.self) { idx in
                CMRadioButton(idx: self.$idx, option: options[idx], value: $value)
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

public struct CMRadioButton<T>: View {
    @Binding var value: T
    @Binding var idx: Int
    var option: CMRadioOption<T>
    
    public var body: some View {
        HStack {
            ZStack {
                Circle().fill(idx == option.idx ? Color.red : Color.clear).frame(width: 26, height: 26)
            }
            Spacer()
            Text("\(option.label)").foregroundColor(idx == option.idx ? .red : .black)
                .onTapGesture {
                    self.idx = option.idx
                }
        }
    }
    
    public init(idx: Binding<Int>, option: CMRadioOption<T>, value: Binding<T>) {
        self._idx = idx
        self.option = option
        self._value = value
    }
}

public struct CMRadioOption<T> {
    @State var idx: Int
    var label: String = ""
    var value: T
    
    public init(idx: Int, label: String, value: T) {
        self._idx = .init(initialValue: idx)
        self.label = label
        self.value = value
    }
}

public enum CMRadioButtonStyle {
    case flat
    case mordern
}
