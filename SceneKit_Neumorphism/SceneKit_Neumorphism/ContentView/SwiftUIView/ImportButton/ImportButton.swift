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
    
    
    @EnvironmentObject var snapshot: Snapshot
    
    
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
        .compositingGroup()
        .blendMode(.multiply)
    }
}
