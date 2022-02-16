import SwiftUI

struct ExampleSwiftUIView {}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    circles
      .blur(radius: 40, opaque: false) {
        Circle()
          .path(in: CGRect(origin: CGPoint(x: 150, y: 260), size: CGSize(width: 100, height: 100)))
      }
      .frame(width: .infinity, height: 600)
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
