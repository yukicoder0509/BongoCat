//
//  BongoCatTypingApp.swift
//  BongoCatTyping
//
//  Created by 楊皓程 on 2025/4/9.
//

import SwiftUI

@main
struct BongoCatTypingApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
            WindowGroup {
                ContentView()
                    .frame(width: 200, height: 200)
            }
            .windowResizability(.contentSize)
            .windowStyle(HiddenTitleBarWindowStyle())
        }
}

// App Delegate to configure window properties
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)

        NotificationCenter.default.addObserver(
            forName: NSWindow.didBecomeKeyNotification,
            object: nil, queue: .main
        ) { [weak self] note in
            guard let window = note.object as? NSWindow else { return }
            self?.configureWindows()
        }
    }
    
    private func configureWindows() {
        // Get all windows
        for window in NSApplication.shared.windows {
            // Make window transparent
            window.backgroundColor = .clear
            
            // Make window stay on top
            window.level = .mainMenu + 1
            
            // Allow window to appear on all spaces
            window.collectionBehavior = [.canJoinAllSpaces, .stationary]
            
            // Hide the traffic light
            window.standardWindowButton(.closeButton)?.isHidden = true
            window.standardWindowButton(.miniaturizeButton)?.isHidden = true
            window.standardWindowButton(.zoomButton)?.isHidden = true
            
            // Position window (e.g., bottom right)
            if let vf = NSScreen.main?.visibleFrame {
                let x = vf.maxX - window.frame.width - 20
                let y = vf.minY + 50
                window.setFrameOrigin(NSPoint(x: x, y: y))
            }
            
            // Allow clicking through parts of the window (if needed)
            window.isOpaque = false
            window.hasShadow = false
            
            // Make the window completely transparent without shadow
            window.titlebarAppearsTransparent = true
            window.titleVisibility = .hidden
            window.styleMask.remove(.titled)
            window.styleMask.insert(.borderless)
        }
    }
}
