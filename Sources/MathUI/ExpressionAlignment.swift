//
//  File.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 15/11/2021.
//

import Foundation
import SwiftUI

extension VerticalAlignment {
    /// A custom alignment for image titles.
    private struct ExpressionAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            // Default to bottom alignment if no guides are set.
            context[VerticalAlignment.center]
        }
    }

    /// A guide for aligning titles.
    static let expression = VerticalAlignment(
        ExpressionAlignment.self
    )
}
