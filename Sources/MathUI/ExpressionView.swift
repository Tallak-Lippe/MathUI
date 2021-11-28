//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import SwiftUI

struct ExpressionView: View {
    @Environment(\.mathConfig) var config
    var expression: Subexpression
    var body: some View {
        Group {
            switch expression {
            case .literal(let double):
                Text("\(double)")
            case .symbol(let symbol, let subexpressions, _):
                Group {
                    switch symbol {
                    case .array(let name):
                        Text(name)
                    case .function(let name, arity: let arity):
                        Text(name)
                    case .infix(let name):
                        InfixOperationView(name: name, lhs: subexpressions[0], rhs: subexpressions[1])
                    case .variable(let name):
                        Text(name)
                    case .prefix(let name):
                        switch name {
                        case ".<":
                            WrappedView(expression: subexpressions[0], position: .leading)
                        default:
                            HStack {
                                Text(name)
                                ExpressionView(expression: subexpressions[0])
                            }
                        }
                    case .postfix(let name):
                        switch name {
                        case ".>":
                            WrappedView(expression: subexpressions[0], position: .trailing)
                        default:
                            HStack {
                                ExpressionView(expression: subexpressions[0])
                                Text(name)
                            }
                        }
                    }
                }
            case .error(let error, let string):
                Text(error.description)
            }
        }
    }
}



//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpressionView(expression: try! ExpressionParser().parse("1 + 2 * (1 + 3/2)/(5 + 3)"))
//    }
//}
