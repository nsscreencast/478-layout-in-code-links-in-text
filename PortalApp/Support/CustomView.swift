//
//  CustomView.swift
//  PortalApp
//
//  Created by Ben Scheirman on 1/25/21.
//

import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        // should be overridden in a subclass
    }
}
