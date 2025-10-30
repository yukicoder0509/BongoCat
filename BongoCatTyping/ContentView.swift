//
//  ContentView.swift
//  BongoCatTyping
//
//  Created by 楊皓程 on 2025/4/9.
//

import SwiftUI
import AppKit
import Cocoa

struct ContentView: View {
    @StateObject private var monitor = KeyBoardMonitor()
    @State private var currentFrame = 0
    @State private var isAnimating = false
    @State private var draggingOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    
    let frames = ["BothHandsUpTransparent","LeftHandDownTransparent","BothHandsUpTransparent", "RightHandDownTransparent"]
    
    var body: some View {
        ZStack{
            // Transparent background
            Color.clear
            // Pet image
            Image(frames[currentFrame % frames.count]).resizable().scaledToFit().frame(width: 200, height: 200)
        }
        .offset(x: position.width + draggingOffset.width,
                y: position.height + draggingOffset.height)
        .gesture(WindowDragGesture())
        .onChange(of: monitor.pressCount) {
            if isAnimating { return }
            currentFrame = (currentFrame + 1) % frames.count
            
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                currentFrame = (currentFrame + 1) % frames.count
                isAnimating = false
            }
        }
    }
}

/*
HELLO world. this is a cat who type with you ! SO CUTE!!!!!!!!
 */
