//
//  FileUploadPreviewImage.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import SwiftUI

enum FileUploadPreviewImage {
    case file
    case image
    case pdf
    case video
    case error

    // MARK: - Properties

    var swiftUIImage: Image {
        switch self {
        case .file:
            return .sparkFileOutline
        case .image:
            return .sparkImageOutline
        case .pdf:
            return .sparkPdfOutline
        case .video:
            return .sparkPlayOutline
        case .error:
            return .sparkWarningOutline
        }
    }
}
