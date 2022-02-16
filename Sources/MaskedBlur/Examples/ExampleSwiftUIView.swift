//
//  ExampleSwiftUIView.swift
//  MaskedBlur
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/MaskedBlur/blob/master/LICENSE for license information.
//

import SwiftUI

struct ExampleSwiftUIView {
  @State var position: CGPoint = CGPoint(x: 120, y: 40)
  
  var simpleDrag: some Gesture {
    DragGesture()
      .onChanged { value in
        self.position = value.location
      }
  }
}

extension ExampleSwiftUIView: View {
  var body: some View {
    circles
      .blur(radius: 40, opaque: false) {
        Circle()
          .path(in: CGRect(origin: position, size: CGSize(width: 50, height: 50)))
      }
      .gesture(
        simpleDrag
      )
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

#if DEBUG

struct ExampleSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleSwiftUIView()
  }
}

#endif
