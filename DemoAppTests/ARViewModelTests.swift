//
//  ARViewModelTests.swift
//  DemoAppTests
//
//  Created by Vishwas Mukund on 20/11/22.
//

import XCTest
import ARKit
import CreditScoreSDK

final class ARViewModelTests: XCTestCase {
    let viewModel = ARViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConfiguration() {
        let config = viewModel.configuration
        XCTAssertEqual(config.planeDetection, .vertical)
        XCTAssertNotEqual(config.planeDetection, [])
    }


}
