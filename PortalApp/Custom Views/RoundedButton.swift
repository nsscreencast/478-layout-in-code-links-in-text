//
//  RoundedButton.swift
//  PortalApp
//
//  Created by Ben Scheirman on 2/4/21.
//

import UIKit

class RoundedButton: UIButton {
    
    private static let ButtonHeight: CGFloat = 60
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        backgroundColor = tintColor
        titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        titleLabel?.textColor = .white
        setTitleColor(.red, for: .selected)
        
        setContentHuggingPriority(.defaultHigh, for: .vertical)
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        layer.cornerRadius = Self.ButtonHeight / 2
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        
        let attrTitle = NSAttributedString(string: title?.uppercased() ?? "", attributes: [
            .kern: 3 as NSNumber
        ])
        
        super.setAttributedTitle(attrTitle, for: state)
    }
    
    override func tintColorDidChange() {
        backgroundColor = tintColor
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .white : tintColor
            titleLabel?.textColor = isHighlighted ? tintColor : .white
        }
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += Self.ButtonHeight / 0.6
        size.height = Self.ButtonHeight
        return size
    }
}

#if DEBUG
import SwiftUI

struct RoundedButton_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ViewPreview<RoundedButton> { button in
                button.setTitle("Try It Free", for: .normal)
            }
        }
        .accentColor(Color(.primaryBlue))
            .previewLayout(.fixed(width: 375, height: 200))
    }
}
#endif

