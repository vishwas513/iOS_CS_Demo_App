//
//  ViewController.swift
//  DemoApp
//
//  Created by Vishwas Mukund on 20/11/22.
//

import UIKit
import CreditScoreSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let data = ScoreViewInitilizer.openJsonFile(fileName: "scoreData") else { return }
        ScoreViewInitilizer.initiateAppFlow(with: self, jsonData: data)
    }


}

