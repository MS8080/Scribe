//
//  ScribeApp.swift
//  Scribe
//
//  A document-based Markdown viewer and editor for macOS
//

import SwiftUI

@main
struct ScribeApp: App {
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        DocumentGroup(newDocument: MarkdownDocument()) { file in
            ContentView(document: file.$document)
                .environmentObject(themeManager)
        }
        .commands {
            CommandGroup(replacing: .help) {
                Button("Send Feedback...") {
                    sendFeedback()
                }

                Button("About Scribe") {
                    showAboutWindow()
                }
            }
        }

        // About window
        Window("About Scribe", id: "about") {
            AboutView()
        }
        .windowResizability(.contentSize)
    }

    private func sendFeedback() {
        let email = "m_sakkal@outlook.com"
        let subject = "Scribe Feedback"
        let body = ""

        let urlString = "mailto:\(email)?subject=\(subject)&body=\(body)"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        if let url = URL(string: urlString) {
            NSWorkspace.shared.open(url)
        }
    }

    private func showAboutWindow() {
        if let url = URL(string: "scribe://about") {
            NSWorkspace.shared.open(url)
        }

        // Open the about window using window ID
        NSApp.sendAction(Selector(("showAboutWindow:")), to: nil, from: nil)
    }
}
