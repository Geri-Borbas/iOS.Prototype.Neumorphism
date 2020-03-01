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
            .foregroundColor(.clear)
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
            .background(
                GeometryReader
                {
                    buttonGeometry -> AnyView in

                    let background = Color.clear // Color.init(.sRGB, white: 0.0, opacity: 0.1)
                    ContentView.buttonFramesForNames[self.name] = buttonGeometry.frame(in: .named("ContentView"))
                    return AnyView(background)
                }
            )
            .padding(
                .horizontal,
                40
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}
