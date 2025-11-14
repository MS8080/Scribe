//
//  ThemeManager.swift
//  Scribe
//
//  Manages application themes and color schemes
//

import SwiftUI

enum AppTheme: String, CaseIterable {
    case system = "System"
    case purple = "Purple"
    case darkBlue = "Dark Blue"

    var backgroundColor: Color {
        switch self {
        case .system:
            return Color(NSColor.textBackgroundColor)
        case .purple:
            return Color(red: 0.25, green: 0.2, blue: 0.35)
        case .darkBlue:
            return Color(red: 0.1, green: 0.15, blue: 0.25)
        }
    }

    var editorBackgroundColor: Color {
        switch self {
        case .system:
            return Color(NSColor.textBackgroundColor)
        case .purple:
            return Color(red: 0.2, green: 0.16, blue: 0.28)
        case .darkBlue:
            return Color(red: 0.08, green: 0.12, blue: 0.2)
        }
    }

    var textColor: Color {
        switch self {
        case .system:
            return Color(NSColor.textColor)
        case .purple, .darkBlue:
            return Color.white
        }
    }

    var headerBackgroundColor: Color {
        switch self {
        case .system:
            return Color(NSColor.controlBackgroundColor)
        case .purple:
            return Color(red: 0.35, green: 0.28, blue: 0.45)
        case .darkBlue:
            return Color(red: 0.15, green: 0.2, blue: 0.35)
        }
    }
}

class ThemeManager: ObservableObject {
    @Published var currentTheme: AppTheme {
        didSet {
            UserDefaults.standard.set(currentTheme.rawValue, forKey: "selectedTheme")
        }
    }

    init() {
        let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme") ?? AppTheme.system.rawValue
        self.currentTheme = AppTheme(rawValue: savedTheme) ?? .system
    }
}
