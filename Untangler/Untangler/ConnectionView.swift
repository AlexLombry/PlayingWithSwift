//
//  ConnectionView.swift
//  Untangler
//
//  Created by Alex Lombry on 15/12/2019.
//  Copyright © 2019 Alex Lombry. All rights reserved.
//

import UIKit

class ConnectionView: UIView {
    
    // Closure call when object move
    // (tells controller to redraw the line)
    var dragChanged: (() -> Void)?
    
    // Drag finished, do something else
    var dragFinished: (() -> Void)?
    
    // When starting touching the view
    var touchStartPos = CGPoint.zero
    
    weak var after: ConnectionView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        // where inside our view did we start touching
        touchStartPos = touch.location(in: self)
        
        // offset by half our width and height (drag from center point of our circle)
        touchStartPos.x -= frame.width / 2
        touchStartPos.y -= frame.height / 2
        
        transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        
        // Bring our circle above all circle
        superview?.bringSubviewToFront(self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.location(in: superview)
        
        center = CGPoint(x: point.x - touchStartPos.x, y: point.y - touchStartPos.y)
        dragChanged?()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        transform = .identity
        dragFinished?()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
}
