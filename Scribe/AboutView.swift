//
//  AboutView.swift
//  Scribe
//
//  About window for Scribe app
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            // App Icon
            Image(nsImage: NSImage(named: "AppIcon") ?? NSImage())
                .resizable()
                .frame(width: 128, height: 128)
                .cornerRadius(20)

            // App Name
            Text("Scribe")
                .font(.system(size: 32, weight: .bold))

            // Version
            Text("Version 1.0")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Divider()
                .padding(.horizontal, 40)

            // Description
            VStack(alignment: .leading, spacing: 12) {
                Text("A beautiful, native macOS Markdown editor and viewer built with SwiftUI.")
                    .multilineTextAlignment(.center)

                Text("Features:")
                    .font(.headline)
                    .padding(.top, 8)

                VStack(alignment: .leading, spacing: 6) {
                    FeatureRow(text: "Live preview with real-time rendering")
                    FeatureRow(text: "Split-view editor and preview panes")
                    FeatureRow(text: "Interactive checkboxes")
                    FeatureRow(text: "Full Markdown support")
                    FeatureRow(text: "Multiple theme options")
                }
            }
            .frame(maxWidth: 400)
            .padding(.horizontal, 20)

            Divider()
                .padding(.horizontal, 40)

            // Credits
            Text("Made by MS")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
        }
        .padding(30)
        .frame(width: 500, height: 600)
    }
}

struct FeatureRow: View {
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
            Text(text)
        }
        .font(.body)
    }
}

#Preview {
    AboutView()
}
