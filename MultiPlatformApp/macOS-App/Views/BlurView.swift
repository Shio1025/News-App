//
//  BlurView.swift
//  macOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import Foundation
import Cocoa
import SwiftUI

struct BlurView: NSViewRepresentable {
    let blur: NSVisualEffectView.BlendingMode
    let vibrancy: NSVisualEffectView.BlendingMode
    let material: NSVisualEffectView.Material
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffect = NSVisualEffectView()
        visualEffect.blendingMode = blur
        visualEffect.material = material
        visualEffect.state = NSVisualEffectView.State.active
        visualEffect.wantsLayer = true
        visualEffect.layer?.backgroundColor = NSColor.clear.cgColor
        return visualEffect
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.blendingMode = blur
        nsView.material = material
    }
}
