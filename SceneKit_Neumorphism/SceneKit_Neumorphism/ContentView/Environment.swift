//
//  Environment.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 02..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


class Environment: ObservableObject
{
    
    
    @Published var viewBounds: CGRect = CGRect.zero
    @Published var buttonFramesForNames: [String:CGRect] = [:]
}
