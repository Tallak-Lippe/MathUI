//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import SwiftUI
import Syntax

struct BinaryOperationView: View {
    @Environment(\.mathConfig) var config
    var operation: Syntax.BinaryOperation<Expression, Expression.Operator>
    var body: some View {
        Group {
            switch operation.operation {
            case .divide:
                FractionView(lhs: operation.lhs, rhs: operation.rhs)
            case .minus:
                simpleOperatorView(oper: "-")
            case .plus:
                simpleOperatorView(oper: "+")
            case .multiply:
                simpleOperatorView(oper: "*")
            case .power:
                PowerView(lhs: operation.lhs, rhs: operation.rhs)
            }
        }
    }
    
    func simpleOperatorView(oper: String) -> some View{
        HStack(alignment: .expression, spacing: config.spacing.width) {
            ExpressionView(expression: operation.lhs)
            Text(oper)
            ExpressionView(expression: operation.rhs)
        }
    }
}

//struct BinaryOperationView_Previews: PreviewProvider {
//    static var previews: some View {
//        BinaryOperationView()
//    }
//}
