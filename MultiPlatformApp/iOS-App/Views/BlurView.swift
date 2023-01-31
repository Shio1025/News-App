//
//  BlurView.swift
//  iOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import Foundation
import SwiftUI

class GradientView: UIView {
    private let gradientLayer = CAGradientLayer()
    
    var colors: [UIColor] = [.red, .blue] {
        didSet {
            updateGradientColors()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        layer.addSublayer(gradientLayer)
        updateGradientColors()
    }
    
    private func updateGradientColors() {
        gradientLayer.colors = colors.map { $0.cgColor }
    }
}

struct BlurView: UIViewRepresentable {
    var colors: [UIColor]
    
    func makeUIView(context: Context) -> GradientView {
        return GradientView()
    }
    
    func updateUIView(_ uiView: GradientView, context: Context) {
        uiView.colors = colors
    }
}
