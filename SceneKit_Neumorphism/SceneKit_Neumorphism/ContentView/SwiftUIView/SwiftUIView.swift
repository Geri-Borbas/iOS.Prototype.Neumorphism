//
//  SwiftUIView.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 02..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


struct SwiftUIView: View
{    

    
    @EnvironmentObject var snapshot: Snapshot
    
    
    var body: some View
    {
        // View builder.
        let view = GeometryReader
        {
            geometry -> AnyView in
            
            // View builder.
            let view = ZStack
            {
                // UI.
                VStack(spacing: 60)
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
            }
            
            // Snapshot.
            print("SwiftUIView.snapshot")
            self.snapshot.viewBounds = geometry.frame(in: CoordinateSpace.local)
            self.snapshot.onChange(self.snapshot)
        
            // Return builder.
            return AnyView(view)
            
        }.environmentObject(self.snapshot)
        
        // Return builder.
        return AnyView(view)
    }
}
