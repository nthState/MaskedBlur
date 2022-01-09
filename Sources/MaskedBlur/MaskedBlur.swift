//
//  MaskedBlur+.swift
//  MaskedBlur
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/MaskedBlur/blob/master/LICENSE for license information.
//

import SwiftUI

public extension View {
  
  func blur<Mask>(radius: CGFloat, opaque: Bool = false, mask: @escaping () -> Mask) -> some View where Mask : Shape {
    modifier(BlurWithMask(radius: radius, opaque: opaque, mask: mask))
  }
  
}

private struct BlurWithMask<Mask>: ViewModifier where Mask: Shape {
  
  private let mask: () -> Mask
  private let radius: CGFloat
  private let opaque: Bool
  
  init(radius: CGFloat, opaque: Bool = false, @ViewBuilder mask: @escaping () -> Mask) {
    self.radius = radius
    self.opaque = opaque
    self.mask = mask
  }
  
  public func body(content: Content) -> some View {
    ZStack {
      content
      content
        .blur(radius: radius, opaque: opaque)
        .mask(
          ContainerShape(shape: mask())
            .fill(style: FillStyle(eoFill: true))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }
  }
  
}

struct ContainerShape<Mask>: Shape where Mask: Shape {
  
  private let shape: Mask
  
  init(shape: Mask) {
    self.shape = shape
  }
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    path.addRect(UIScreen.main.bounds)
    path.addPath(shape.path(in: rect))
    
    return path
  }
}








//public struct MaskedBlur {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}
//
//import SwiftUI
//
//struct TestView2: View {
//
//  @State var position: CGPoint = .zero
//
//  var simpleDrag: some Gesture {
//    DragGesture()
//      .onChanged { value in
//        self.position = value.location
//      }
//  }
//
//  var body: some View {
//    ZStack {
//
//      Circle()
//        .fill(Color.green)
//        .frame(height: 200)
//
//      Circle()
//        .fill(Color.pink)
//        .frame(height: 200)
//        .offset(x: 50, y: 100)
//
//      Circle()
//        .fill(Color.orange)
//        .frame(height: 100)
//        .offset(x: -50, y: 00)
//    }
//    .maskedBlur(position: $position)
//    .gesture(
//      simpleDrag
//    )
//
//  }
//}
//
//struct MaskedBlur: ViewModifier {
//
//  @Binding var position: CGPoint
//
//  /// Render the content twice
//  func body(content: Content) -> some View {
//
//    ZStack {
//      content
//
//      content
//        .blur(radius: 10)
//        .mask(
//          Hole(position: $position)
//            .fill(style: FillStyle(eoFill: true))
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        )
//    }
//
//  }
//}
//
//extension View {
//  func maskedBlur(position: Binding<CGPoint>) -> some View {
//    self.modifier(MaskedBlur(position: position))
//  }
//}
//
//struct Hole: Shape {
//
//  //@Binding var position: CGPoint
//  
//
//  func path(in rect: CGRect) -> Path {
//    var path = Path()
//
//    path.addRect(UIScreen.main.bounds)
//
//    //path.addEllipse(in: CGRect(x: position.x, y: position.y, width: 200, height: 200))
//    //path.addPath(<#T##path: Path##Path#>)
//
//    return path
//  }
//}
//
//
//#if DEBUG
//
//struct TestView2_Previews: PreviewProvider {
//  static var previews: some View {
//    TestView2()
//  }
//}
//
//#endif
