//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import SwiftUI

struct InfixOperationView: View {
    @Environment(\.mathConfig) var config
    var name: String
    var lhs: Subexpression
    var rhs: Subexpression
    var body: some View {
        Group {
            switch name {
            case "/":
                FractionView(lhs: lhs, rhs: rhs)
            case "^":
                PowerView(lhs: lhs, rhs: rhs)
            default:
                simpleOperatorView(oper: name)
            }
        }
    }
    
    func simpleOperatorView(oper: String) -> some View{
        HStack(alignment: .expression, spacing: config.spacing.width) {
            ExpressionView(expression: lhs)
            Text(oper)
            ExpressionView(expression: rhs)
        }
    }
}

//struct BinaryOperationView_Previews: PreviewProvider {
//    static var previews: some View {
//        BinaryOperationView()
//    }
//}
