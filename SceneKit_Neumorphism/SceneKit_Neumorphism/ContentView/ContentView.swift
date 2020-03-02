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
    
    
    var environment = Environment()
    
    
    static var buttonFramesForNames: [String:CGRect] = [:]
    
    
    var body: some View
    {
        
        ZStack
        {
            SceneKitView().edgesIgnoringSafeArea(.all)
            .onAppear
            {
                print("SceneKitView.onAppear")
                print("viewBounds: \(String(describing: self.environment.viewBounds))")
            }
            SwiftUIView().edgesIgnoringSafeArea(.all)
                .compositingGroup()
                .blendMode(.multiply)
                // .clipped()
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(self.environment)
        .onAppear
        {
            print("ContentView.onAppear")
            print("viewBounds: \(String(describing: self.environment.viewBounds))")
//            print("buttonFrame[new]: \(String(describing: ContentView.buttonFramesForNames["new"]))")
//            print("buttonFrame[camera]: \(String(describing: ContentView.buttonFramesForNames["camera"]))")
//            print("buttonFrame[library]: \(String(describing: ContentView.buttonFramesForNames["library"]))")
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    
    
    static var previews: some View
    { ContentView() }
}
