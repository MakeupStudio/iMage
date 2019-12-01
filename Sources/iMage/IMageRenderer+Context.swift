//
//  IMageRenderer+Context.swift
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

// MARK: - Declaration
extension IMage.Renderer {
    
    public struct Context {
        public let format: Format
        
        #if os(iOS)
        private let underlyingContext: UIGraphicsImageRendererContext
        init(_ context: UIGraphicsImageRendererContext = .init(), format: Format = .init()) {
            self.underlyingContext = context
            self.format = format
        }
        #endif
        
        public var cgContext: CGContext? {
            #if os(OSX)
            guard let context = NSGraphicsContext.current?.cgContext
            else {
                assertionFailure("Unavailable cgContext while drawing")
                return nil
            }
            return context
            #else
            return underlyingContext.cgContext
            #endif
        }
    }
    
}

// MARK: - Declaration
extension IMage.Renderer.Context {
    
    public struct Format {
        public var opaque = false
        public var prefersExtendedRange = false
        public var scale = CGFloat(2)
        internal(set) public var bounds: CGRect = .zero
        
        #if os(iOS)
        func createUIGraphicsImageRendererFormat() -> UIGraphicsImageRendererFormat {
            let format = UIGraphicsImageRendererFormat()
            format.opaque = opaque
            format.prefersExtendedRange = prefersExtendedRange
            format.scale = scale
            return format
        }
        #endif
    }
    
}
