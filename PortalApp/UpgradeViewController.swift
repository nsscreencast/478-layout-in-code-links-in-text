//
//  UpgradeViewController.swift
//  PortalApp
//
//  Created by Ben Scheirman on 1/19/21.
//

import UIKit
import SnapKit

class UpgradeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .primaryBlue
    
        configureSubviews()
    }
    
    private func configureSubviews() {
        view.backgroundColor = .white
        
        let background = BackgroundView()
        view.addSubview(background)
       
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let contentStack = UIStackView()
        contentStack.axis = .vertical
        contentStack.spacing = 24
        contentStack.alignment = .center
        contentStack.distribution = .fill
        
        view.addSubview(contentStack)
        contentStack.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(14)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-14)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
        }
        
        let label1 = UILabel()
        label1.numberOfLines = 0
        label1.textAlignment = .center
        label1.font = .boldSystemFont(ofSize: 38)
        label1.textColor = .white
        label1.text = "Unlock the World.\nFree for 7 Days."
        contentStack.addArrangedSubview(label1)
        
        let label2 = UILabel()
        label2.numberOfLines = 0
        label2.textAlignment = .center
        label2.textColor = .white
        contentStack.addArrangedSubview(label2)
        
        let pStyle2 = NSMutableParagraphStyle()
        pStyle2.lineSpacing = 10
        let lightFont2 = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        let attrString2 = NSMutableAttributedString(string: "Enjoy ", attributes: [.font: lightFont2, .paragraphStyle: pStyle2])
        let boldFont2 = UIFont.boldSystemFont(ofSize: 20)
        attrString2.append(.init(string: "Full Access", attributes: [.font: boldFont2]))
        attrString2.append(.init(string: " to the Portal Library.\n", attributes: [.font: lightFont2]))
        attrString2.append(.init(string: "Free for 7 days, then £29.99/year.", attributes: [.font: boldFont2]))

        label2.attributedText = attrString2
        
        let tryButton = RoundedButton()
        tryButton.setTitle("Try it Free", for: .normal)
        contentStack.addArrangedSubview(tryButton)
        tryButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        let termsTextView = UITextView()

        let termsFont = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        
        let termsPara = NSMutableParagraphStyle()
        termsPara.alignment = .center
        let termsAttrString = NSMutableAttributedString(string: "By continuing you agree to our ", attributes: [
            .font: termsFont,
            .foregroundColor: UIColor.systemGray4,
            .paragraphStyle: termsPara
        ])
        
        termsAttrString.append(.init(string: "Terms & Conditions", attributes: [
            .link: URL(string: "https://portal.app")!
        ]))
        
        termsAttrString.append(.init(string: ". Portal members renews automatically unless auto-renew is turned off at least 24h before the trial period ends.", attributes: [
            .font: termsFont,
            .foregroundColor: UIColor.systemGray4,
            .paragraphStyle: termsPara
        ]))
        
        termsTextView.isSelectable = true
        termsTextView.linkTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor.systemGray3,
            .underlineStyle: NSUnderlineStyle.single.rawValue as NSNumber
        ]
        termsTextView.attributedText = termsAttrString
        contentStack.addArrangedSubview(termsTextView)
        
        termsTextView.isScrollEnabled = false
        termsTextView.isEditable = false
        termsTextView.backgroundColor = .clear
    }
}

class BackgroundView: CustomView {
    override func setupView() {
        let imageView = UIImageView(image: UIImage(named: "night-scene"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        let fadeToBlack = GradientView()
        fadeToBlack.isOpaque = false
        fadeToBlack.startColor = .clear
        fadeToBlack.endColor = .black
        fadeToBlack.locations = [0.25, 0.58]
        addSubview(fadeToBlack)
        
        fadeToBlack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI

struct UpgradeViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview<UpgradeViewController>()
            .edgesIgnoringSafeArea(.all)
    }
}
#endif
