//
//  FileUploadPreviewFileViewer.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 30/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import WebKit
@_spi(SI_SPI) import SparkCommon

/// A view that displays files based on their type: images, videos, or web content.
struct FileUploadPreviewFileViewer: View {

    // MARK: - Properties

    let filename: String
    let fileDetails: FileUploadDetails
    @Binding var isPresented: Bool
    @State private var showNavigationBar = true

    // MARK: - View

    var body: some View {
        NavigationView {
            ZStack {
                switch self.fileDetails.previewViewerType {
                case .image:
                    FileUploadPreviewImageViewer(url: self.fileDetails.url)
                case .video:
                    FileUploadPreviewVideoViewer(url: self.fileDetails.url)
                case .pdf:
                    FileUploadPreviewPDFViewer(url: self.fileDetails.url)
                case .webview:
                    FileUploadPreviewWebViewer(url: self.fileDetails.url)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(self.filename)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.isPresented = false
                    }) {
                        Image.sparkCross
                    }
                    .tint(.primary)
                }
            }
            .toolbar(self.showNavigationBar ? .visible : .hidden)
            .ignoresSafeArea()
            .onTapGesture {
                withOptionalAnimation {
                    self.showNavigationBar.toggle()
                }
            }
        }
    }
}
