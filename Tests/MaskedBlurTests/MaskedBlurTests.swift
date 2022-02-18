//
//  MaskedBlurTests.swift
//  MaskedBlur
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/MaskedBlur/blob/main/LICENSE for license information.
//

import XCTest
import SwiftUI
@testable import MaskedBlur

final class MaskedBlurTests: XCTestCase {
  
    func test_correct_path_generated() throws {
        
      let shape = Rectangle()
      
      let container = ContainerShape(shape: shape)
      
      let actual = container.path(in: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
      
      XCTAssertEqual(actual.description, "0 0 m 100 0 l 100 100 l 0 100 l h 0 0 m 100 0 l 100 100 l 0 100 l h", "Path should match")
    }
  
}
