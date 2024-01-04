//
//  AppConfigurations.swift
//  RxLearning
//
//  Created by Jisoo HAM on 1/4/24.
//

import Foundation

class AppConfigurations {
    lazy var apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as! String
    lazy var apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as! String
}
