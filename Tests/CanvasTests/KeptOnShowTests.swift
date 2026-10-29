import XCTest
import CoreGraphics
@testable import Canvas

final class KeptOnShowTests: XCTestCase {
    private let screen = CGRect(x: 0, y: 0, width: 1440, height: 900)
    private let centre = CGPoint(x: 720, y: 450)

    func testNeighbourBesideTheEnteredWindowStays() {
        let beside = CGRect(x: 980, y: 80, width: 400, height: 300)
        XCTAssertTrue(CanvasController.keepsNeighbourOnShow(beside, on: screen, clearOf: centre))
    }

    func testLargeWindowReachingInFromOffscreenDoesNotCoverTheMiddle() {
        // Origin just off the left edge, wide enough to cross the entered window's centre.
        let cursor = CGRect(x: -200, y: 40, width: 1200, height: 800)
        XCTAssertFalse(CanvasController.keepsNeighbourOnShow(cursor, on: screen, clearOf: centre))
    }

    func testWindowEntirelyOffscreenIsLeftOut() {
        let away = CGRect(x: 2000, y: 40, width: 800, height: 600)
        XCTAssertFalse(CanvasController.keepsNeighbourOnShow(away, on: screen, clearOf: centre))
    }
}
