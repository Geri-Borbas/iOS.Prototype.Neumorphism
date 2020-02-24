import UIKit
import SceneKit
import PlaygroundSupport


func sceneView() -> SCNView?
{
    // iPhone 11 Screen.
    let width = 375.0
    let height = 812.0
    
    // Capsule button dimensions.
    let outlineWidth: CGFloat = 40.0
    let buttonWidth: CGFloat = 295.0 + outlineWidth * 2
    let buttonHeight: CGFloat = 85.0 + outlineWidth * 2
        
    // Scene view.
    let frame = CGRect(x: 0, y: 0, width: width, height: height)
    let sceneView = SCNView(frame: frame)
        sceneView.allowsCameraControl = true
        sceneView.antialiasingMode = .multisampling4X
        sceneView.scene = SCNScene()
    
    // Camera.
    let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        camera.orthographicScale = height / 2
        camera.zNear = -height
        camera.zFar = height
    
    // Camera node.
    let cameraNode = SCNNode()
        cameraNode.camera = camera
    
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
        ambientLight.intensity = 500
    
    // Ambient light node.
    let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
    
    // Capsule button.
    let path = UIBezierPath(
        roundedRect: CGRect(
            x: -buttonWidth / 2,
            y: -buttonHeight / 2,
            width: buttonWidth,
            height: buttonHeight
        ),
        cornerRadius: buttonHeight / 2
    )
    
    // Profile.
    let profile = UIBezierPath()
        profile.move(to: CGPoint(x: 0.00, y: 1.00))
        profile.addCurve(
            to: CGPoint(x: 1.00, y: 0.00),
            controlPoint1: CGPoint(x: 0.00, y: 0.25),
            controlPoint2: CGPoint(x: 0.25, y: 0.00))
    
    // More detailed.
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
        
    // Unwrap root node.
    guard let rootNode = sceneView.scene?.rootNode
    else { return nil }
    
    // Add nodes.
    rootNode.addChildNode(cameraNode)
    rootNode.addChildNode(ambientLightNode)
    rootNode.addChildNode(lightNode)
    rootNode.addChildNode(backlightNode)
    rootNode.addChildNode(SCNNode(geometry: SCNPlane(width: CGFloat(width), height: CGFloat(height))))
    rootNode.addChildNode(SCNNode(geometry: shape))
    
    return sceneView
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView()
