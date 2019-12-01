//
//  IMage.swift
//  iMage
//
//  Created by Maxim Krouk on 12/2/19.
//  Copyright © 2019 Maxim Krouk. All rights reserved.
//

#if os(OSX)
import Cocoa
#else
import UIKit
#endif

extension IMage {
    
    /// Renders an IMage using provided rect and actions
    ///
    /// Example:
    /// ```
    ///     IMage.render(in: .init(x: 0, y: 0, width: 10, height: 10) {
    ///         let ctx = $0.cgContext
    ///         ctx.addRect(.init(x: 2, y: 2, width: 6, height: 6))
    ///         ctx.fillPath()
    ///     }
    /// ```
    ///
    /// - Parameter rect: Bounds of new image.
    /// - Parameter actions: Contextual drawing actions.
    static func render(in rect: CGRect, actions: @escaping Renderer.Actions) -> IMage {
        return Renderer(bounds: rect).render(actions: actions)
    }
    
}
