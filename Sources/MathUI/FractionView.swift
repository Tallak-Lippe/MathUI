//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 11/11/2021.
//

import SwiftUI

struct FractionView: View {
    @Environment(\.mathConfig) var config
    var lhs: Subexpression
    var rhs: Subexpression
    var body: some View {
        VStack(spacing: config.spacing.height) {
            ExpressionView(expression: lhs)
                .overlay(
                    Rectangle()
                        .padding(.horizontal, -config.fractionLinePadding)
                        .frame(height: config.fractionLineHeight)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: config.spacing.height + config.fractionLineHeight / 2)
                )
                .alignmentGuide(.expression, computeValue: {d in d[VerticalAlignment.bottom]})
            Color.clear.frame(width: 0, height: 0)
                
            ExpressionView(expression: rhs)
                .overlay(
                    Rectangle()
                        .padding(.horizontal, -config.fractionLinePadding)
                        .frame(height: config.fractionLineHeight)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .offset(y: -config.spacing.height - config.fractionLineHeight / 2)
                )
        }
        .padding(.horizontal, config.fractionLinePadding)
    }
}

