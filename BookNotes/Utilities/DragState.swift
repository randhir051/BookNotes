//
//  DragState.swift
//  BookNotes
//
//  Created by Randhir Singh on 06/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - DRAG STATES

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

