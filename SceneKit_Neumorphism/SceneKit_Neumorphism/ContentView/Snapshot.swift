//
//  Geometry.swift
//  SceneKit_Neumorphism
//
//  Created by Geri Borbás on 2020. 03. 02..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import SwiftUI


class Snapshot : ObservableObject
{
    
    
    var viewBounds: CGRect = CGRect.zero
    var buttonFramesForNames: [String:CGRect] = [:]
    
    
    public var onChange: (Snapshot) -> Void = { snapshot in }
}
