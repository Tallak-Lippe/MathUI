//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 12/11/2021.
//

import SwiftUI

struct PowerView: View {
    var lhs: Expression
    var rhs: Expression
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ExpressionView(expression: lhs)
                .alignmentGuide(.expression, computeValue: {d in d[VerticalAlignment.center]})
            ExpressionView(expression: rhs)
            //Find out how to scale the frame as well
                .scaleEffect(0.8, anchor: .bottomLeading)
                .alignmentGuide(VerticalAlignment.center, computeValue: {d in d[.bottom]})
        }
    }
}

struct PowerView_Previews: PreviewProvider {
    static var previews: some View {
        PowerView(lhs: try! ExpressionParser().parse("1"), rhs: try! ExpressionParser().parse("2 / 2 + 1"))
    }
}
