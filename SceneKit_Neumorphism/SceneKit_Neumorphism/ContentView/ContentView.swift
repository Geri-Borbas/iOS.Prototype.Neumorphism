//
//  ContentView.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 01..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


struct ContentView: View
{
    
    
    static var viewBounds: CGRect?
    static var buttonFramesForNames: [String:CGRect] = [:]
    
    
    var body: some View
    {
        
        ZStack
        {
            // SceneKit.
            SceneKitView()
                .edgesIgnoringSafeArea(.all)
            
            // SwiftUI.
            GeometryReader
            {
                geometry -> AnyView in
                
                let stack = VStack(spacing: 60)
                {
                    ImportButton(name: "new", imageName: "doc", text: "create new")
                    ImportButton(name: "camera", imageName: "camera", text: "from camera")
                    ImportButton(name: "library", imageName: "photo.on.rectangle", text: "from library")
                }
                .frame(
                    minWidth: 0, maxWidth: .infinity,
                    minHeight: 0, maxHeight: .infinity,
                    alignment: .center
                )
                .edgesIgnoringSafeArea(.all)
                .coordinateSpace(name: "ContentView")
                .background(Color.clear)
                
                ContentView.viewBounds = geometry.frame(in: CoordinateSpace.local)
                
                return AnyView(stack)
            }
            .onAppear
            {
                print("ContentView.viewBounds: \(String(describing: ContentView.viewBounds))")
                print("ContentView.buttonFrame[new]: \(String(describing: ContentView.buttonFramesForNames["new"]))")
                print("ContentView.buttonFrame[camera]: \(String(describing: ContentView.buttonFramesForNames["camera"]))")
                print("ContentView.buttonFrame[library]: \(String(describing: ContentView.buttonFramesForNames["library"]))")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
