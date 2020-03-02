//
//  Capsule.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 01..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


struct Capsule: ButtonStyle
{
       
    
    var name: String
    
        
    func makeBody(configuration: Self.Configuration) -> some View
    {
        configuration.label
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            .padding(16)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(40)
            .padding(3 + 3)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(
                        Color.gray,
                        lineWidth: 3
                )
                .opacity(configuration.isPressed ? 0.8 : 1.0)
            )
            .padding(
                .horizontal,
                40
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}
