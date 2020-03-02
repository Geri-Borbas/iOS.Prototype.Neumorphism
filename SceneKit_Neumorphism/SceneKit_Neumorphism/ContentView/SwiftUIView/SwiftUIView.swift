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

    
    @EnvironmentObject var environment: Environment
    
    
    var body: some View
    {
        GeometryReader
        {
            geometry in
            
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
            .onAppear
            {
                print("SwiftUIView.onAppear")
                
                // Publish geometry.
                self.environment.viewBounds = geometry.frame(in: CoordinateSpace.local)
                
                print("viewBounds: \(String(describing: self.environment.viewBounds))")
            }
        }
                
    }
}
