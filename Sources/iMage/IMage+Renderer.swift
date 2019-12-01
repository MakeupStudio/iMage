//
//  IMage+Renderer.swift
//  iMage
//
//  Created by Maxim Krouk on 12/2/19.
//  Copyright © 2019 Maxim Krouk. All rights reserved.
//

#if os(OSX)
import Cocoa
public typealias IMage = NSImage
#else
import UIKit
public typealias IMage = UIImage
#endif

// MARK: - Typealiases
extension IMage.Renderer {
    
    public typealias Output = IMage
    public typealias Actions = (inout Context) -> Void
    
}

// MARK: - Declaration
extension IMage {
    
    public final class Renderer {
        public var format: Context.Format
        
        /// Creates an image with specified parameters
        public init(bounds: CGRect, format: Context.Format) {
            self.format = format
            self.format.bounds = bounds
        }
        
        /// Renders an IMage using provided rect and actions
        ///
        /// Example:
        /// ```
        ///     let renderer = IMage.Renderer(size: .init(width: 10, height: 10))
        ///     renderer.render {
        ///         let ctx = $0.cgContext
        ///         ctx.addRect(.init(x: 2, y: 2, width: 6, height: 6))
        ///         ctx.fillPath()
        ///     }
        /// ```
        ///
        /// - Parameter actions: Contextual drawing actions.
        /// - Returns: Rendered IMage
        public func render(actions: @escaping Actions) -> Output {
            #if os(OSX)
                let image = IMage(size: format.bounds.size, flipped: true) { rect in
                    var context = Context(format: self.format)
                    actions(&context)
                    return true
                }
                return image
            #else
            return createUIGraphicsImageRenderer().image { ctx in
                var context = Context(ctx, format: format)
                actions(&context)
            }
            #endif
        }

        #if os(iOS)
        func createUIGraphicsImageRenderer() -> UIGraphicsImageRenderer {
            UIGraphicsImageRenderer(bounds: format.bounds,
                                    format: format.createUIGraphicsImageRendererFormat())
        }
        #endif
        
    }

}

// MARK: - Convenience inits
extension IMage.Renderer {
    
    public convenience init(size: CGSize) {
        self.init(size: size, format: .init())
    }
    
    public convenience init(bounds: CGRect = .zero) {
        self.init(bounds: bounds, format: .init())
    }
    
    public convenience init(size: CGSize, format: Context.Format) {
        self.init(bounds: .init(origin: .zero, size: size), format: format)
    }
    
}
