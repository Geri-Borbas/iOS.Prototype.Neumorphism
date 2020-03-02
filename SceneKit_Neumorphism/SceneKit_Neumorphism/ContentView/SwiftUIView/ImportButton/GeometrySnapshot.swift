//
//  GeometrySnapshot.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 02..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


struct GeometrySnapshot: View
{
    
    
    var name: String
    
    
    @EnvironmentObject var snapshot: Snapshot

    
    var body: some View
    {
        GeometryReader
        {
            geometry -> AnyView in

            // View builder.
            let view = RoundedRectangle(cornerRadius: 2)
                .strokeBorder(
                    style: StrokeStyle(
                        lineWidth: 1 ,dash: [2]
                    )
                )
                .foregroundColor(Color.red.opacity(0.0))
            
            // Snapshot.
            print("GeometrySnapshot.snapshot")
            self.snapshot.buttonFramesForNames[self.name] = geometry.frame(in: .named("ContentView"))
            self.snapshot.onChange(self.snapshot)
            
            // Return builder.
            return AnyView(view)
        }
    }
}
