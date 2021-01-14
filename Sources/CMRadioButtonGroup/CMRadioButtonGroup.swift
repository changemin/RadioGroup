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

public struct CMRadioButton<T>: View {
    @Binding var value: T
    @Binding var idx: Int
    var option: CMRadioOption<T>
    var size: CGFloat = 24
    var color: Color
    
    public var body: some View {
        HStack {
            ZStack {
                Circle()
                    .strokeBorder(Color.gray,lineWidth: 1)
                    .frame(width: size, height: size)
                Circle()
                    .fill(color)
                    .frame(width: idx == option.idx ? size-8 : 0, height: idx == option.idx ? size-8 : 0)
            }
            Text("\(option.label)")
                .onTapGesture {
                    self.value = option.value
                    withAnimation(.spring()) {
                        self.idx = option.idx
                    }
                }
                .font(Font.system(size: 17, weight: .medium, design: .rounded))
        }.contentShape(Rectangle())
    }
    
    public init(idx: Binding<Int>, option: CMRadioOption<T>, value: Binding<T>, color: Color) {
        self._idx = idx
        self.option = option
        self._value = value
        self.color = color
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

//public struct CMRadioButtonStyle {
//    case flat
//    case mordern
//    case rectangle
//}
