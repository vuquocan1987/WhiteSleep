//
//  TimeStruct.swift
//  Audio Player
//
//  Created by an vu on 8/24/19.
//  Copyright © 2019 Or Fleisher. All rights reserved.
//

import Foundation
struct TimeArray {
    static let range1 = [30,45]
    static let range2 = Array(1...15).map{
        $0*60
    }
    static let range3 = Array(4...12).map{
        $0*60*5
    }
    static let range4 = Array(5...12).map{
        $0*60*15
    }
    static let range5 = [210*60]
    static let range6 = Array(4...12).map{
        $0*60*60
    }
    static let range7 = [24*3600]
    static let range = range1 + range2 + range3 + range4 + range5 + range6 + range7
}
