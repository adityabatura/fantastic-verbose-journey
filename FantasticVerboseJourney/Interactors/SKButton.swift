//
//  SKButton.swift
//  FantasticVerboseJourney
//
//  Created by SLim on 30/12/18.
//  Copyright © 2018 CousinMango. All rights reserved.
//

import SpriteKit.SKNode

class SKButton: SKSpriteNode {
    weak var delegate: SKButtonDelegate!
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("SKButton:: touchesBegan()")
        guard let tap: UITouch = touches.first else { return }
        print("SKButton touchesBegan() tap \(tap)")
        
        // Simple touch response effect for button node.
        self.setScale(0.85)
        //        if self.contains(tap.location(in: self)) { // redundant?
        //
        //        }
        self.delegate.skButtonTapped(sender: self)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("SKButton:: touchesEnded()")
        self.setScale(1.0) // restore default button size.
    }
    
}