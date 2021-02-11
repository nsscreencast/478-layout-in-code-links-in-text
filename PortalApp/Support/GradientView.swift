//
//  GradientView.swift
//  PortalApp
//
//  Created by Ben Scheirman on 1/20/21.
//

import UIKit

class GradientView: UIView {
    var startColor: UIColor = .blue {
        didSet {
            updateGradient()
            setNeedsDisplay()
        }
    }
    var endColor: UIColor = .red {
        didSet {
            updateGradient()
            setNeedsDisplay()
        }
    }
    var locations: [CGFloat] = [0, 1] {
        didSet {
            updateGradient()
            setNeedsDisplay()
        }
    }
    
    private var gradient: CGGradient?
    
    private func updateGradient() {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        gradient = CGGradient(colorsSpace: colorSpace,
                   colors: [startColor.cgColor, endColor.cgColor] as CFArray,
                   locations: locations)
    }
    
    override func draw(_ rect: CGRect) {
        if gradient == nil {
            updateGradient()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let start = CGPoint(x: 0, y: 0)
        let end = CGPoint(x:0, y: bounds.size.height)
        context.drawLinearGradient(gradient!, start: start, end: end, options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
    }
}

#if DEBUG
import SwiftUI
struct GradientPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let gradientView = GradientView()
        gradientView.startColor = .cyan
        gradientView.endColor = .blue
        return gradientView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
struct Gradient_Previews: PreviewProvider {
    static var previews: some View {
        GradientPreview()
            .previewLayout(.fixed(width: 300, height: 500))
    }
}
#endif
