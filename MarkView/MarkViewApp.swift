//
//  MarkViewApp.swift
//  MarkView
//
//  A document-based Markdown viewer and editor for macOS
//

import SwiftUI

@main
struct MarkViewApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MarkdownDocument()) { file in
            ContentView(document: file.$document)
        }
        .commands {
            // Add custom commands here if needed
            CommandGroup(replacing: .help) {
                Button("MarkView Help") {
                    // Open help documentation
                }
            }
        }
    }
}
