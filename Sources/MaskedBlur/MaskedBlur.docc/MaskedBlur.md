# ``MaskedBlur``

Blur a View allowing another View to act as a mask to knock a hole in the Blur, 
to reveal an unblurred version

## Overview

| Before | After |
|--------|-------|
![Before](01_Blur.png)|![After](03_Blur.png)

```
import SwiftUI
import MaskedBlur

struct MyCirclesView: View {

  var body: some View {
    MyCircles()
      .blur(radius: 40, opaque: false) {
        Circle()
          .path(in: CGRect(origin: CGPoint(x: 40, y: 20), size: CGSize(width: 150, height: 150)))
      }
  }
  
  var MyCircles: some View {
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
  }
}

struct MyCirclesView_Previews: PreviewProvider {
  static var previews: some View {
    MyCirclesView()
  }
}
```

## Topics

### Guides

- <doc:Getting-Started-with-MaskedBlur>
