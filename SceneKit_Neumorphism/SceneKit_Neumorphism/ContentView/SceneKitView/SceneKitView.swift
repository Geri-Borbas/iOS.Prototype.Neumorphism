//
//  SceneKitView.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 01..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI
import SceneKit


struct SceneKitView : UIViewRepresentable
{
    
    
    @EnvironmentObject var snapshot: Snapshot

    
    func makeCoordinator() -> SceneCoordinator
    { SceneCoordinator() }
    
    
    func makeUIView(context: UIViewRepresentableContext<SceneKitView>) -> SCNView
    {
        print("SceneKitView.makeUIView")
        
        // Look for changes.
        self.snapshot.onChange = context.coordinator.onChange
        
        // Create scene view.
        return context.coordinator.sceneView
    }

    func updateUIView(_ view: SCNView, context: Context)
    {
        print("SceneKitView.updateUIView")
    }
}


#if DEBUG
struct SwiftUIView_Previews : PreviewProvider
{
    
    static var previews: some View
    { SceneKitView() }
}
#endif
