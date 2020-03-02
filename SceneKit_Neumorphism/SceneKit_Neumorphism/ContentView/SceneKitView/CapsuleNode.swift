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
    
    
    static func Node(for frame: CGRect, outlineWidth: CGFloat) -> SCNNode
    {
        // Capsule button.
        let path = UIBezierPath(
            roundedRect: frame,
            cornerRadius: frame.size.height / 2
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
        let shape = SCNShape(path: path, extrusionDepth: outlineWidth * 2)
            shape.chamferMode = .front
            shape.chamferRadius = outlineWidth
            shape.chamferProfile = detailedProfile
        
        return SCNNode(geometry: shape)
    }
}
