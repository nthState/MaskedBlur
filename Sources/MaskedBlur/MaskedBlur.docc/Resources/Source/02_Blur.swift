import SwiftUI
import MaskedBlur

struct ExampleSwiftUIView {}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    circles
  }
  
  var circles: some View {
    ZStack {
      Circle()
        .fill(Color.green)
        .frame(height: 200)
      
      Circle()
        .fill(Color.pink)
        .frame(height: 200)
        .offset(x: 50, y: 100)
      
      Circle()
        .fill(Color.orange)
        .frame(height: 100)
        .offset(x: -50, y: 00)
    }
    .frame(width: .infinity, height: 600)
  }
  
}
