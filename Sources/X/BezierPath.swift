#if os(macOS)
import AppKit.NSBezierPath
public typealias BezierPath = NSBezierPath

public struct RectCorner : OptionSet {
	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
	
	public init() {
		self = []
	}
	
	public var rawValue: Int
	
	public static var topLeft = RectCorner(rawValue: 1 << 0)
	public static var topRight = RectCorner(rawValue: 1 << 1)
	public static var bottomLeft = RectCorner(rawValue: 1 << 2)
	public static var bottomRight = RectCorner(rawValue: 1 << 3)
	
	public static var allCorners = [.topLeft, .topRight, .bottomLeft, bottomRight]
}


// Ported from https://github.com/iccir/XUIKit/blob/master/Source/XUIBezierPathAdditions.m
// sPathApplier()
func pathApplier(info: UnsafeMutableRawPointer?, elementPointer: UnsafePointer<CGPathElement>) -> Void
{
	guard let info = info else { return }
	
	let path = Unmanaged<NSBezierPath>.fromOpaque(info).takeUnretainedValue()
	
	let element = elementPointer.pointee
	
	switch (element.type) {
	case .moveToPoint:
		path.move(to: element.points[0])
		
	case .addLineToPoint:
		path.addLine(to: element.points[0])
		
	case .addQuadCurveToPoint:
		path.addQuadCurve(to: element.points[1],
						  controlPoint: element.points[0])
		
	case .addCurveToPoint:
		path.addCurve(to: element.points[2],
					  controlPoint1: element.points[0],
					  controlPoint2: element.points[1])
		
	case .closeSubpath:
		path.close()
		
	@unknown default:
		fatalError()
	}
}


extension NSBezierPath {
	
	@available(macOS 10.5, *)
	public convenience init(roundedRect rect: CGRect, cornerRadius: CGFloat) { // rounds all corners with the same horizontal and vertical radius
		self.init(roundedRect: rect, xRadius: cornerRadius, yRadius: cornerRadius)
	}
	
	
	// Ported from https://github.com/iccir/XUIKit/blob/master/Source/XUIBezierPathAdditions.m
	// +xui_bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:
	public convenience init(roundedRect rect: CGRect, byRoundingCorners corners: RectCorner, cornerRadii: CGSize) {
		let path = CGMutablePath()
		
		let topLeft = rect.origin
		let topRight = CGPoint(x: rect.maxX, y: rect.minY)
		let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
		let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
		
		if corners.contains(.topLeft) {
			path.move(to: CGPoint(x: topLeft.x + cornerRadii.width,
								  y: topLeft.y))
		}
		else {
			path.move(to: CGPoint(x: topLeft.x,
								  y: topLeft.y))
		}
		
		if corners.contains(.topRight) {
			path.addLine(to: CGPoint(x: topRight.x - cornerRadii.width,
									 y: topRight.y))
			path.addCurve(to: CGPoint(x: topRight.x, y: topRight.y),
						  control1: CGPoint(x: topRight.x, y: topRight.y + cornerRadii.height),
						  control2: CGPoint(x: topRight.x, y: topRight.y + cornerRadii.height))
		}
		else {
			path.addLine(to: CGPoint(x: topRight.x,
									 y: topRight.y))
		}
		
		if corners.contains(.bottomRight) {
			path.addLine(to: CGPoint(x: bottomRight.x,
									 y: bottomRight.y - cornerRadii.height))
			path.addCurve(to: CGPoint(x: bottomRight.x, y: bottomRight.y),
						  control1: CGPoint(x: bottomRight.x - cornerRadii.width, y: bottomRight.y),
						  control2: CGPoint(x: bottomRight.x - cornerRadii.width, y: bottomRight.y))
		}
		else {
			path.addLine(to: CGPoint(x: bottomRight.x,
									 y: bottomRight.y))
		}
		
		if corners.contains(.bottomLeft) {
			path.addLine(to: CGPoint(x: bottomLeft.x + cornerRadii.width,
									 y: bottomLeft.y))
			path.addCurve(to: CGPoint(x: bottomLeft.x, y: bottomLeft.y),
						  control1: CGPoint(x: bottomLeft.x, y: bottomLeft.y - cornerRadii.height),
						  control2: CGPoint(x: bottomLeft.x, y: bottomLeft.y - cornerRadii.height))
		}
		else {
			path.addLine(to: CGPoint(x: bottomLeft.x, y: bottomLeft.y))
		}
		
		if corners.contains(.topLeft) {
			path.addLine(to: CGPoint(x: topLeft.x,
									 y: topLeft.y+cornerRadii.height))
			path.addCurve(to: CGPoint(x: topLeft.x, y: topLeft.y),
									  control1: CGPoint(x: topLeft.x + cornerRadii.width, y: topLeft.y),
									  control2: CGPoint(x: topLeft.x + cornerRadii.width, y: topLeft.y))
		}
		else {
			path.addLine(to: CGPoint(x: topLeft.x,
									 y: topLeft.y))
		}
		
		path.closeSubpath()
		
		self.init()
		self.cgPath = path
	}
	
	public convenience init(arcCenter center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
		self.init()
		
		self.appendArc(withCenter: center, radius:radius, startAngle:startAngle, endAngle:endAngle, clockwise:clockwise)
	}
	
	public convenience init(cgPath CGPath: CGPath) {
		self.init()
		
		self.cgPath = cgPath
	}
	

	// Returns an immutable CGPath.
	// Setting the path will create an immutable copy of the provided CGPathRef, so any further mutations on a provided CGMutablePathRef will be ignored.
	// Based on https://stackoverflow.com/questions/1815568/how-can-i-convert-nsbezierpath-to-cgpath
	public var cgPath: CGPath {
		get {
			let path = CGMutablePath()
			var points = [CGPoint](repeating: .zero, count: 3)
			
			for i in 0 ..< self.elementCount {
				let type = self.element(at: i, associatedPoints: &points)
				
				switch type {
				case .moveTo:
					path.move(to: points[0])
					
				case .lineTo:
					path.addLine(to: points[0])
					
				case .curveTo:
					path.addCurve(to: points[2], control1: points[0], control2: points[1])
					
				case .closePath:
					path.closeSubpath()
					
				@unknown default:
					break
				}
			}
			
			return path
		}
		
		set {
			self.removeAllPoints()
			if (newValue.isEmpty) { return }
			
			let info = Unmanaged.passUnretained(self).toOpaque()

			newValue.apply(info: info,
						   function: pathApplier)
		}
	}
	
	
	// Path construction
	
	public func addLine(to point: CGPoint) {
		self.line(to: point)
	}
	
	public func addCurve(to endPoint: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) {
		self.curve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
	}
	
	public func addArc(withCenter center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
		self.appendArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
	}
	
	// Ported from https://github.com/iccir/XUIKit/blob/master/Source/XUIBezierPathAdditions.m
	// -[XUIKitAdditions_Implementation xui_addQuadCurveToPoint:controlPoint:]
	public func addQuadCurve(to endPoint: CGPoint, controlPoint: CGPoint) {
		// See http://fontforge.sourceforge.net/bezier.html
		
		let QP0 = self.currentPoint
		let CP3 = endPoint
		
		let CP1 = CGPoint(x: QP0.x + ((2.0 / 3.0) * (controlPoint.x - QP0.x)),
						  y: QP0.y + ((2.0 / 3.0) * (controlPoint.y - QP0.y)))
		
		let CP2 = CGPoint(x: endPoint.x + (2.0 / 3.0) * (controlPoint.x - endPoint.x),
						  y: endPoint.y + (2.0 / 3.0) * (controlPoint.y - endPoint.y))
		
		self.curve(to: CP3,
				   controlPoint1: CP1,
				   controlPoint2: CP2)
	}
	
	
	// Modified paths
	
	public func reversing() -> BezierPath {
		return self.reversed
	}
	
	
	// Transforming paths
	
	// Ported from https://github.com/iccir/XUIKit/blob/master/Source/XUIBezierPathAdditions.m
	// -[XUIKitAdditions_Implementation xui_applyTransform:]
	public func apply(_ transform: CGAffineTransform) {
		let nsTransform = NSAffineTransform()
		
		let transformStruct = NSAffineTransformStruct(
			m11: transform.a,
			m12: transform.b,
			m21: transform.c,
			m22: transform.d,
			tX: transform.tx,
			tY: transform.ty
		)
		
		nsTransform.transformStruct = transformStruct
		self.transform(using: nsTransform as AffineTransform)
	}
	
	
	// Drawing properties
	
	// Default is `false`. When `true`, the even-odd fill rule is used for drawing, clipping, and hit testing.
	public var usesEvenOddFillRule: Bool {
		get {
			return self.windingRule == .evenOdd
		}
		
		set {
			self.windingRule = newValue ? .evenOdd : .nonZero
		}

	}
	
	// These two methods do not affect the blend mode or alpha of the current graphics context
	// Ported from https://github.com/iccir/XUIKit/blob/master/Source/XUIBezierPathAdditions.m
	// -[XUIKitAdditions_Implementation xui_fillWithBlendMode:alpha:]
	@available(OSX 10.10, *)
	open func fill(with blendMode: CGBlendMode, alpha: CGFloat) {
		guard let context = GraphicsGetCurrentContext() else {
			return
		}
		
		context.saveGState()
		
		context.setBlendMode(blendMode)
		context.setAlpha(alpha)
		
		self.fill()
		
		context.restoreGState()
	}
	
	// Ported from https://github.com/iccir/XUIKit/blob/master/Source/XUIBezierPathAdditions.m
	// -[XUIKitAdditions_Implementation xui_strokeWithBlendMode:alpha:]
	@available(OSX 10.10, *)
	open func stroke(with blendMode: CGBlendMode, alpha: CGFloat)
 {
		guard let context = GraphicsGetCurrentContext() else {
			return
		}
		
		context.saveGState()
		
		context.setBlendMode(blendMode)
		context.setAlpha(alpha)
		
		self.stroke()
		
		context.restoreGState()
	}

}
#else
import UIKit.UIBezierPath
public typealias BezierPath = UIBezierPath

public typealias RectCorner = UIRectCorner
#endif
