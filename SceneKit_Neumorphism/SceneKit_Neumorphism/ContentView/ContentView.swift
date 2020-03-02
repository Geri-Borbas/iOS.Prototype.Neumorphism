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
    
    
    var snapshot = Snapshot()
    
    
    var body: some View
    {
        
        ZStack
        {
            SceneKitView().edgesIgnoringSafeArea(.all)
            SwiftUIView().edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(self.snapshot)
    }
}

struct ContentView_Previews: PreviewProvider
{
    
    
    static var previews: some View
    { ContentView() }
}
