//
//  SwiftUIView.swift
//  
//
//  Created by Tallak Lindseth von der Lippe on 15/11/2021.
//

import SwiftUI

struct WrappedView: View {
    @Environment(\.mathConfig) var config
    var expression: Subexpression
    var body: some View {
        HStack(spacing: config.parenthesisPadding.width) {
            ExpressionView(expression: expression)
                .padding(.horizontal, config.parenthesisPadding.width)
        }
        .overlay(
            GeometryReader { proxy in
                HStack {
                        parenthesis
                        .frame(width: min(proxy.size.height * config.parenthesisAspectRatio, config.parenthesisPadding.width))
                        Spacer()
                        parenthesis
                        .frame(width: min(proxy.size.height * config.parenthesisAspectRatio, config.parenthesisPadding.width))
                            .rotationEffect(.degrees(180))
                }
            }
            .padding(.vertical, config.parenthesisPadding.height)
        )
    }
    
    var parenthesis: some View {
        GeometryReader { proxy in
            Path { path in
                let width = proxy.size.width
                let height = proxy.size.height
                let lineWidth = config.parenthesisLineWidth
                path.move(to: CGPoint(x: width, y: 0))
                path.addQuadCurve(
                    to: CGPoint(x: width, y: height),
                    control: CGPoint(x: 0, y: height / 2))
                path.addLine(to: CGPoint(x: width - lineWidth, y: height))
                path.addQuadCurve(
                    to: CGPoint(x: width - lineWidth, y: 0),
                    control: CGPoint(x: -lineWidth, y: height / 2))
            }
            .fill(.foreground)
        }
    }
}
//
//struct WrappedView_Previews: PreviewProvider {
//    static var previews: some View {
//        WrappedView(expression: try! ExpressionParser().parse("1 + 1"))
//    }
//}
