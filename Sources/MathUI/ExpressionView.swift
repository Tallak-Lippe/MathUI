//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import SwiftUI

struct ExpressionView: View {
    @Environment(\.mathConfig) var config
    var expression: Expression
    var body: some View {
        Group {
            switch expression.storage {
            case .binaryOperation(let binaryOperation):
                BinaryOperationView(operation: binaryOperation)
            case .wrapped(let expression):
                WrappedView(expression: expression)
            case .double(let num):
                Text("\(num)")
            case .int(let num):
                Text("\(num)")
            case .function(let (function, argument)):
                HStack{
                    switch function{
                    case .sqrt:
                        Text("Sqrt")
                    case .string(let str):
                        Text(str)
                    }
                }
                WrappedView(expression: argument)
            }
        }
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressionView(expression: try! ExpressionParser().parse("1 + 2 * (1 + 3/2)/(5 + 3)"))
    }
}
