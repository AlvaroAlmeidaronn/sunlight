import XCTest
@testable import Canvas

final class TutorialTests: XCTestCase {
    func testFiveOrSixStepsForEachInput() {
        for input in Tutorial.Input.allCases {
            let steps = input.steps
            XCTAssertTrue((5...6).contains(steps.count), "\(input)")
            XCTAssertEqual(Set(steps.map(\.gesture)).count, steps.count, "\(input): no loop twice")
            XCTAssertEqual(Set(steps.map(\.title)).count, steps.count, "\(input)")
            for step in steps {
                XCTAssertFalse(step.line.isEmpty, step.title)
                XCTAssertFalse(step.how.isEmpty, step.title)
            }
        }
    }

    /// A trackpad step's words are its gesture's, so a gesture changed in `GestureGuide` changes here
    /// too; every mouse step brings its own.
    func testTrackpadStepsUseTheGesturesOwnWordsAndMouseStepsTheirOwn() {
        for step in Tutorial.trackpad {
            XCTAssertNil(step.mouse, step.title)
            XCTAssertEqual(step.how, step.gesture.how)
        }
        for step in Tutorial.mouse {
            XCTAssertNotNil(step.mouse, step.title)
            XCTAssertFalse(step.how.localizedCaseInsensitiveContains("finger"), step.title)
        }
    }

    /// Both teach the same moves in the same order: see everything first, then the click that goes into a
    /// window, before moving one.
    func testBothTeachTheSameMovesClickBeforeDrag() {
        XCTAssertEqual(Tutorial.trackpad.map(\.title), Tutorial.mouse.map(\.title))
        for input in Tutorial.Input.allCases {
            let gestures = input.steps.map(\.gesture)
            XCTAssertEqual(gestures.first, .fourFingerTap, "\(input)")
            XCTAssertEqual(input.steps[0].resolved(seeAll: .swipeUp).gesture, .swipeUp, "\(input)")
            XCTAssertEqual(input.steps[1].resolved(seeAll: .swipeUp).gesture, input.steps[1].gesture, "\(input)")
            let click = gestures.firstIndex(of: .click)
            let drag = gestures.firstIndex(of: .drag)
            XCTAssertNotNil(click, "\(input)")
            XCTAssertNotNil(drag, "\(input)")
            if let click, let drag { XCTAssertLessThan(click, drag, "\(input)") }
            XCTAssertEqual(click.map { $0 + 1 }, gestures.firstIndex(of: .doubleClick), "\(input): double-click right after click")
        }
    }

    func testStepsStayInRange() {
        for input in Tutorial.Input.allCases {
            XCTAssertEqual(Tutorial.step(-3, for: input), input.steps.first)
            XCTAssertEqual(Tutorial.step(99, for: input), input.steps.last)
            XCTAssertFalse(Tutorial.isLast(0, for: input))
            XCTAssertTrue(Tutorial.isLast(input.steps.count - 1, for: input))
        }
    }
}
