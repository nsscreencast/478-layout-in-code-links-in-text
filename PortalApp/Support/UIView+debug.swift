//
//  UIView+debug.swift
//  PortalApp
//
//  Created by Ben Scheirman on 2/4/21.
//

import UIKit

#if DEBUG

extension UIView {
    func debugOutline(color: UIColor = .cyan, width: CGFloat = 2) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
#endif
