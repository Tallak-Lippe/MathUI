
import Foundation
import Syntax

struct ExpressionParser: Parser {
    var body: AnyParser<Expression> {
        Recursive { parser in
            Either {
                BinaryOperationParser {
                    parser
                }
                .map(Expression.binaryOperation)

                Group {
                    RegularExpression("^[a-zA-Z]*")
                    "("
                    parser
                    ")"
                }
                //Function overloading was bugging out, had to use another version of the function to make it shut up
                .mapWithLocation({ output , _  -> Expression in
                    var function = Expression.Function.sqrt
                    let functionName = String(output.0.text)
                    //If more functions should get special treatment, add it here
                    switch functionName {
                    case "sqrt":
                        function = Expression.Function.sqrt
                    default:
                        function = Expression.Function.string(functionName)
                    }
                    
                    return Expression(.function((function, output.1)))
                })
                
                Group {
                    "("
                    parser

                    ")"
                }
                .map(Expression.wrapped)

                IntLiteral().map(Expression.int)

                DoubleLiteral().map(Expression.double)
            }
        }
    }
}

