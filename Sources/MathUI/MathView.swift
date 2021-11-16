//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import SwiftUI

public struct MathView: View {
    public init(_ str: String) {
        expression = try? ExpressionParser().parse(str)
    }
    
    var expression: Expression?
    
    public var body: some View {
        Group {
            if let expression = expression {
                ExpressionView(expression: expression)
            } else {
                Text("Invalid math string entered")
            }
        }
    }
}

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView("1 + 1/2")
    }
}
