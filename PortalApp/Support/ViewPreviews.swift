//
//  ViewPreviews.swift
//  PortalApp
//
//  Created by Ben Scheirman on 2/4/21.
//

#if DEBUG
import SwiftUI

struct ViewPreview<V: UIView>: UIViewRepresentable {
    
    var configBlock: (V) -> () = { _ in }
    
    func makeUIView(context: Context) -> V {
        let view = V()
        configBlock(view)
        return view
    }
    
    func updateUIView(_ uiView: V, context: Context) {
    }
}
#endif
