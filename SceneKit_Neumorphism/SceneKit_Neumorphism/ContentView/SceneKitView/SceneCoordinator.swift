//
//  SceneCoordinator.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 02..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI
import SceneKit
   
    
class SceneCoordinator: NSObject
{
    
    
    var sceneView: SCNView
    
    
    private var scene: SCNScene
    private var camera: SCNCamera
    private var backplane: SCNNode
    private var buttonNodes: SCNNode
    
    
    override init()
    {
        // iPhone 11 Screen.
        let width = 414.0
        let height = 818.0
        
        // Scene.
        self.scene = SCNScene()
        
        // Scene view.
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        let sceneView = SCNView(frame: frame)
            sceneView.allowsCameraControl = true
            sceneView.antialiasingMode = .multisampling4X
            sceneView.contentMode = .redraw
            sceneView.scene = self.scene
                
        // Camera.
        self.camera = SCNCamera()
        self.camera.usesOrthographicProjection = true
        self.camera.orthographicScale = height / 2
        self.camera.zNear = -height
        self.camera.zFar = height
        
        // Camera node.
        let cameraNode = SCNNode()
            cameraNode.camera = self.camera
        
        // Light.
        let temperatureMultiplier: CGFloat = 1.4
        let light = SCNLight()
            light.type = .omni
            light.intensity = 600
            light.temperature = 6500 / temperatureMultiplier
            light.shadowMode = .deferred
        
        // Light node.
        let lightNode = SCNNode()
            lightNode.light = light
            lightNode.position = SCNVector3(x: -300, y: 300, z: 200)
            
        // Backlight.
        let backlight = SCNLight()
            backlight.type = .omni
            backlight.intensity = 100
            backlight.temperature = 6500 * temperatureMultiplier
            backlight.shadowMode = .deferred
        
        // Backlight node.
        let backlightNode = SCNNode()
            backlightNode.light = backlight
            backlightNode.position = SCNVector3(x: 100, y: -100, z: 300)
                
        // Ambient light.
        let ambientLight = SCNLight()
            ambientLight.type = .ambient
            ambientLight.intensity = 300
        
        // Ambient light node.
        let ambientLightNode = SCNNode()
            ambientLightNode.light = ambientLight
        
        // Create backplane.
        self.backplane = SCNNode(geometry: SCNPlane(width: CGFloat(width), height: CGFloat(height)))
        
        // Create buttons.
        let outlineWidth: CGFloat = 40.0
        let buttonWidth: CGFloat = 334.0 + outlineWidth * 2
        let buttonHeight: CGFloat = 83.66666666666663 + outlineWidth * 2
        self.buttonNodes = SCNNode()
        self.buttonNodes.addChildNode(
            CapsuleNode.Node(
                for: CGRect(
                    x: -buttonWidth / 2,
                    y: -buttonHeight / 2,
                    width: buttonWidth,
                    height: buttonHeight
                ),
                outlineWidth: outlineWidth
        ))
        
        // Add nodes.
        self.scene.rootNode.addChildNode(cameraNode)
        self.scene.rootNode.addChildNode(ambientLightNode)
        self.scene.rootNode.addChildNode(lightNode)
        self.scene.rootNode.addChildNode(backlightNode)
        self.scene.rootNode.addChildNode(self.backplane)
        self.scene.rootNode.addChildNode(self.buttonNodes)
        
        // Reference.
        self.sceneView = sceneView
        
        // Default.
        super.init()
        
        // Rendering events.
        self.sceneView.delegate = self
    }
    
    func onChange(_ snapshot: Snapshot)
    {
        print("SceneKitView.environment.onChange")
        print("viewBounds: \(String(describing: snapshot.viewBounds))")
        print("buttonFramesForNames[\"camera\"]: \(String(describing: snapshot.buttonFramesForNames["camera"]))")
                
        // Adjust bounds.
        self.sceneView.frame = snapshot.viewBounds
        
        // Backplane size.
        self.backplane.geometry = SCNPlane(
            width: snapshot.viewBounds.width,
            height: snapshot.viewBounds.height
        )

        // Camera settings.
        let height = Double(snapshot.viewBounds.height)
        self.camera.orthographicScale = height / 2
        self.camera.zNear = -height
        self.camera.zFar = height

        print("sceneView.frame: \(String(describing: sceneView.frame))")
    }
}


extension SceneCoordinator: SCNSceneRendererDelegate
{

    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval)
    {
        // print("SceneKitView.Coordinator.renderer(_:updateAtTime:)")
    }
}
