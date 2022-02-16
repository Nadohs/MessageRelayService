//
//  ProtoWireKitSwiftTests.swift
//  ProtoWireKitSwiftTests
//
//  Created by Richard Fox on 1/5/22.
//

import XCTest
import ProtoWireKit

@objc protocol Sums {
    var total: Int {get}
    func mathWith(target: Int)
}

class AddOnly: Sums {
    var total = 0
    
    func mathWith(target: Int) {
        total += target;
    }
}

class SubOnly: NSObject, Sums {
    var total = 0
    
    func mathWith(target: Int) {
        total -= target
    }
}

class MultiOnly: NSObject, Sums {
    var total = 0
    func mathWith(target: Int) {
        total *= target
    }
}

class ProtoWireKitSwiftTests: XCTestCase {
    
    func testProtoWireFirst() {
        let dispatcher: PWKDispatcher<Sums> = PWKDispatcher()
        let subs = SubOnly()
        let mults = MultiOnly()
        mults.total = 2
        dispatcher.addListener(subs)
        dispatcher.addListener(mults)
        let reciever = dispatcher.targetReciever
        reciever.mathWith(target: 2)
        reciever.mathWith(target: 2)
        print(subs.total)
        print(mults.total)
        XCTAssert(subs.total == -4, "subs should be -4")
        XCTAssert(mults.total == 8, "mults should be 8, 2*2*2 = 8")
        let adds = AddOnly()
        dispatcher.addListener(adds)
        dispatcher.removeListener(mults)
        reciever.mathWith(target: 2)
        reciever.mathWith(target: 2)
        print(subs.total)
        print(mults.total)
        print(adds.total)
        XCTAssert(subs.total == -8, "subs should be -4")
        XCTAssert(adds.total == 4, "adds should be 4")
        XCTAssert(mults.total == 8, "mults should be 8, 2*2*2 = 8")
    }

}
