//
//  ImportButton.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 01..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


struct ImportButton: View
{
    
    
    @EnvironmentObject var environment: Environment
    
    
    var name: String
    var imageName: String
    var text: String

    
    var body: some View
    {
        Button(
            action:
            {
                print("'\(self.name)' button tapped.")
            }
        )
        {
            HStack
            {
                Image(systemName: imageName).font(.title)
                Text(text).font(.title).fontWeight(.bold)
            }
        }
        .buttonStyle(Capsule(name: self.name))
        .background(
            GeometryReader
            {
                buttonGeometry -> AnyView in

                let background = Color.clear // Color.init(.sRGB, white: 0.0, opacity: 0.1)
                    .onAppear()
                    {
                        self.environment.buttonFramesForNames[self.name] = buttonGeometry.frame(in: .named("ContentView"))
                    }
                ContentView.buttonFramesForNames[self.name] = buttonGeometry.frame(in: .named("ContentView"))
                
                return AnyView(background)
            }
        )
    }
}
