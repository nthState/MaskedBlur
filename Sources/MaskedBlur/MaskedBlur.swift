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
  
  func blur<MaskShape>(radius: CGFloat, opaque: Bool = false, mask: @escaping () -> MaskShape) -> some View where MaskShape : Shape {
    modifier(BlurWithMask(radius: radius, opaque: opaque, mask: mask))
  }
  
}

/**
Blurs a view, The mask provided creates a hole in the blur to see the content underneath
 
 The content is rendered twice. The second content pass is blurred and masked so that we can create
 the effect
 */
public struct BlurWithMask<MaskShape>: ViewModifier where MaskShape: Shape {
  
  /// The `shape` which acts as the mask
  private let mask: () -> MaskShape
  /// Blur radius
  private let radius: CGFloat
  /// Is the view opaque
  private let opaque: Bool
  
  public init(radius: CGFloat, opaque: Bool = false, @ViewBuilder mask: @escaping () -> MaskShape) {
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

/// We need to create the inverse of the shape so that we can create a hole
internal struct ContainerShape<Mask>: Shape where Mask: Shape {
  
  private let shape: Mask
  
  init(shape: Mask) {
    self.shape = shape
  }
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    path.addRect(rect)
    path.addPath(shape.path(in: rect))
    
    return path
  }
}
