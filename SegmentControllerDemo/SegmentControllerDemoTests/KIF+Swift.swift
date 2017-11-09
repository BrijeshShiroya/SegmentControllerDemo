//
//  KIF+Swift.swift
//  SegmentControllerDemoTests
//
//  Created by Creole02 on 11/6/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import Foundation
import KIF
import XCTest

extension XCTestCase {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
}

extension KIFTestActor {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
}
