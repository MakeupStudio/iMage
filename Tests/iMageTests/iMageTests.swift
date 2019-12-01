import XCTest
@testable import iMage

final class ImageRendererTests: XCTestCase {
    
    func testExample() {
        // 1
        func imageWithCircle(_ size: CGSize) -> IMage {
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            let actions: IMage.Renderer.Actions = {
                let ctx = $0.cgContext!
                ctx.setFillColor(NSColor.white.cgColor)
                ctx.fill(rect)
                ctx.addEllipse(in: rect.insetBy(dx: 10, dy: 10))
                ctx.setFillColor(NSColor.red.withAlphaComponent(0.7).cgColor)
                ctx.fillPath()
            }
            
            let renderer = IMage.Renderer(size: size)
            let result = renderer.render(actions: actions)
            
            return result
        }
        
        _ = imageWithCircle(CGSize(width: 100, height: 100))
        
        // 2
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let actions: IMage.Renderer.Actions = {
            let ctx = $0.cgContext!
            ctx.setFillColor(NSColor.white.cgColor)
            ctx.fill(rect)
            ctx.addEllipse(in: rect.insetBy(dx: 10, dy: 10))
            ctx.setFillColor(NSColor.red.withAlphaComponent(0.7).cgColor)
            ctx.fillPath()
        }
        
        _ = IMage.render(in: rect, actions: actions)
        _ = IMage.Renderer(bounds: rect).render(actions: actions)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
    
}
