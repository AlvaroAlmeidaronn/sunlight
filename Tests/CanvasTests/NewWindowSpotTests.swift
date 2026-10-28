import XCTest
@testable import Canvas

final class NewWindowSpotTests: XCTestCase {
    private let view = CGRect(x: 0, y: 0, width: 2000, height: 1200)
    private let gap: CGFloat = 32
    private let size = CGSize(width: 400, height: 300)

    private func spot(_ others: [CGRect], size: CGSize? = nil) -> CGRect {
        NewWindowSpot.spot(size: size ?? self.size, avoiding: others, view: view, gap: gap)
    }

    private var centred: CGRect { CGRect(x: 800, y: 450, width: 400, height: 300) }

    func testOnAnEmptyCanvasItOpensInTheMiddleOfTheView() {
        XCTAssertEqual(spot([]), centred)
    }

    func testWhenTheMiddleIsFreeItOpensThere() {
        let corner = CGRect(x: 0, y: 0, width: 400, height: 300)
        XCTAssertEqual(spot([corner]), centred)
    }

    func testWhenTheMiddleIsTakenItGoesRightBesideTheWindowThere() {
        let a = CGRect(x: 700, y: 400, width: 600, height: 400)
        let r = spot([a])
        XCTAssertTrue(NewWindowSpot.isClear(r, of: [a], gap: gap), "\(r)")
        // Level with the middle, a gap off the window's nearer side: below it (its short side).
        XCTAssertEqual(r, CGRect(x: 800, y: 832, width: 400, height: 300))
    }

    func testItNeverLandsOnAnyWindow() {
        let windows = [CGRect(x: 600, y: 300, width: 400, height: 300), CGRect(x: 1032, y: 300, width: 400, height: 300),
                       CGRect(x: 600, y: 632, width: 400, height: 300), CGRect(x: 1032, y: 632, width: 400, height: 300)]
        let r = spot(windows)
        XCTAssertTrue(NewWindowSpot.isClear(r, of: windows, gap: gap), "\(r)")
        XCTAssertTrue(view.contains(r), "\(r)")
    }

    func testARoomySpotInViewBeatsANearerOneOffScreen() {
        // A window filling the view but for a strip on the right: the only spot in view is that strip.
        let a = CGRect(x: 0, y: 0, width: 1500, height: 1200)
        let r = spot([a])
        XCTAssertTrue(view.contains(r), "\(r)")
        XCTAssertEqual(r.minX, a.maxX + gap)
    }

    func testEdgesExactlyAGapApartAreClear() {
        let a = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(NewWindowSpot.isClear(CGRect(x: 132, y: 0, width: 100, height: 100), of: [a], gap: gap))
        XCTAssertFalse(NewWindowSpot.isClear(CGRect(x: 120, y: 0, width: 100, height: 100), of: [a], gap: gap))
    }
}
