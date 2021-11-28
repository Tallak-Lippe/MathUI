//
//  File.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import Foundation
import SwiftUI

public struct MathConfig {
    public var spacing: CGSize = CGSize(width: 4, height: 0)
    public var fractionLineHeight: CGFloat = 1
    public var fractionLinePadding: CGFloat = 3
    public var parenthesisLineWidth: CGFloat = 1
    public var parenthesisAspectRatio: CGFloat = 0.2
    public var parenthesisPadding: CGSize = CGSize(width: 8, height: 2)
}

public extension View {
    func editMathConfig(_ edit: (inout MathConfig) -> Void) -> some View {
        @Environment(\.mathConfig) var configuration;
        var newConfiguration = configuration
        edit(&newConfiguration)
        return self.environment(\.mathConfig, newConfiguration)
    }
}

struct MathConfigKey: EnvironmentKey {
    static let defaultValue = MathConfig()
}

extension EnvironmentValues {
    var mathConfig: MathConfig {
        get {self[MathConfigKey.self]}
        set {self[MathConfigKey.self] = newValue}
    }
}
