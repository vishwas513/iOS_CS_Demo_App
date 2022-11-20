//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by Vishwas Mukund on 20/11/22.
//

import XCTest
@testable import DemoApp
import CreditScoreSDK

final class InitilizerTests: XCTestCase {
    
    var data: Data?
    
    let initViewModel = InitlizerViewModel()

    override func setUpWithError() throws {
        data = ScoreViewInitilizer.openJsonFile(fileName: "scoreData")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        data = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOpenJsonFileSuccess() {
        XCTAssertNotNil(data)
    }
    
    func testOpenJsonFileFailure() {
        let failCaseData = ScoreViewInitilizer.openJsonFile(fileName: "failureText") ?? Data()
        XCTAssertEqual(String(data: failCaseData, encoding: .utf8), "")
    }
    
    func testParseDataSuccess() {
        guard let data = data, let _ = initViewModel.parseData(with: data) else { return
            XCTFail("Something return nil")
        }
        XCTAssertTrue(true)
    }
    
    func testParseDataFailure() {
        let scoreData = initViewModel.parseData(with: Data())
        XCTAssertNil(scoreData)
    }
}
