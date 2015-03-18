//
//  ActivityProtocal.swift
//  SampleApp
//
//  Created by Sridhar Vemula on 2/27/15.
//  Copyright (c) 2015 Sridhar Vemula. All rights reserved.
//

import Foundation

protocol ActivityProtocol {
    func getDayMeasure(date:NSDate) -> JSON?
    
    func getRangeMeasure(startdate:NSDate, enddate:NSDate) -> JSON?
    
}