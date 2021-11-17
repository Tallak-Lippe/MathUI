//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import SwiftUI

public struct MathView: View {
    public init(_ str: String) {
        expression = Expression(str, options: .noOptimize)
    }
    
    var expression: Expression
    
    public var body: some View {
        ExpressionView(expression: expression.root)
    }
}

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView("1 + 1/2")
    }
}
