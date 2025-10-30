//
//  KeyBoardMonitor.swift
//  BongoCatTyping
//
//  Created by 楊皓程 on 2025/4/11.
//

import AppKit

class KeyBoardMonitor: ObservableObject {
    @Published var pressCount: Int = 0
    
    private var eventTap: CFMachPort?
    private var runLoopSource: CFRunLoopSource?
    
    init() {
        let pointerToSelf = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        let mask = (1<<CGEventType.keyDown.rawValue)
        
        if let tap = CGEvent.tapCreate(tap: .cgSessionEventTap,
                                       place: .headInsertEventTap,
                                       options: .defaultTap,
                                       eventsOfInterest: CGEventMask(mask),
                                       callback: {_, type, event, refcon in
            if type == .keyDown, let refcon = refcon {
                let monitor = Unmanaged<KeyBoardMonitor>.fromOpaque(refcon).takeUnretainedValue()
                DispatchQueue.main.async {
                    monitor.pressCount += 1
//                    print("Key pressed! Frame: \\(monitor.currentFrame)")
                }
            }
            return Unmanaged.passRetained(event)
        }, userInfo: pointerToSelf){
            eventTap = tap
            runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, tap, 0)
            CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
            CGEvent.tapEnable(tap: tap, enable: true)
        }
        else{
            print("Failed to create CGEventTap (make sure accessibility permission is granted)")
        }
    }
    
    deinit {
        if let tap = eventTap{
            CGEvent.tapEnable(tap: tap, enable: false)
        }
    }
}
