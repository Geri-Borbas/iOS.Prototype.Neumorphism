//
//  CapsuleNode.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 02..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation
import SceneKit


struct CapsuleNode
{
    
    
    static func Node(for frame: CGRect, in viewBounds: CGRect, outlineWidth: CGFloat) -> SCNNode
    {
        // Frame.
        let capsuleWidth = frame.width + outlineWidth * 2.0
        let capsuleHeight = frame.height + outlineWidth * 2.0
        let capsuleFrame = CGRect(
            x: -capsuleWidth / 2.0,
            y: -capsuleHeight / 2.0,
            width: capsuleWidth,
            height: capsuleHeight
        )
        
        // Path.
        let path = UIBezierPath(
            roundedRect: capsuleFrame,
            cornerRadius: capsuleHeight / 2
        )
        
        // Profile.
        let profile = UIBezierPath()
            profile.move(to: CGPoint(x: 0.00, y: 1.00))
            profile.addCurve(
                to: CGPoint(x: 1.00, y: 0.00),
                controlPoint1: CGPoint(x: 0.00, y: 0.25),
                controlPoint2: CGPoint(x: 0.25, y: 0.00))
        
        // More detailed profile.
        let sharpness: CGFloat = 0.6
        let detailedProfile = UIBezierPath()
            detailedProfile.move(to: CGPoint(x: 0.00, y: 1.00))
            detailedProfile.addCurve(
                to: CGPoint(x: 0.90, y: 0.10),
                controlPoint1: CGPoint(x: 0.00, y: 1.00 - 0.90 * sharpness),
                controlPoint2: CGPoint(x: 0.90 - 0.90 * sharpness, y: 0.10))
            detailedProfile.addCurve(
                to: CGPoint(x: 1.00, y: 0.00),
                controlPoint1: CGPoint(x: 1.00 - 0.1 * (1.0 - sharpness), y: 0.10),
                controlPoint2: CGPoint(x: 1.00, y: 0.10 - 0.1 * (1.0 - sharpness)))
            
        // Path subdivisions.
        path.flatness = 0.1
        profile.flatness = 0.1
        detailedProfile.flatness = 0.1
        
        // Assemble geometry.
        let depth = outlineWidth > 0.0 ? outlineWidth * 2 : capsuleHeight
        let shape = SCNShape(path: path, extrusionDepth: depth)
            shape.chamferMode = .front
            shape.chamferRadius = outlineWidth
            shape.chamferProfile = detailedProfile
        
        // Position.
        let halfViewSize = CGPoint(x: viewBounds.size.width / 2.0, y: viewBounds.size.height / 2.0)
        let halfFrameSize = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
        let screenPosition = CGPoint(
            x: frame.origin.x - halfViewSize.x + halfFrameSize.x,
            y: frame.origin.y - halfViewSize.y - halfFrameSize.y
        )
        let worldPosition = SCNVector3(
            x: Float(screenPosition.x),
            y: Float(-screenPosition.y), // Flip (!)
            z: 0.0
        )
        
        // Node.
        let node = SCNNode(geometry: shape)
            node.worldPosition = worldPosition
        
        return node
    }
}
