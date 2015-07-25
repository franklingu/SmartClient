//
//  VolunteeringRecordsViewController.swift
//  Tau
//
//  Created by Gu Junchao on 25/7/15.
//  Copyright (c) 2015 Tau. All rights reserved.
//

import UIKit
import PNChart

class VolunteeringRecordsViewController: UIViewController {
    @IBOutlet weak var chartViewFrame: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let xLabelsSource = ["Feb", "Mar", "Apr", "May", "Jun", "Jul"]
        let lineChart = PNLineChart(frame: self.chartViewFrame.frame)
        lineChart.setXLabels(xLabelsSource, withWidth: self.chartViewFrame.frame.width / CGFloat(xLabelsSource.count) - 10.0)
        let data1Source = [4, 2.5, 5.5, 4.7, 2.5, 7.3]
        let data1 = PNLineChartData()
        data1.color = UIColor.redColor()
        data1.itemCount = UInt(xLabelsSource.count)
        data1.getData = { index -> PNLineChartDataItem in
            print(index)
            let yValue: CGFloat = CGFloat(data1Source[Int(index)])
            return PNLineChartDataItem(y: yValue)
        }
        
        lineChart.chartData = [data1]
        lineChart.strokeChart()
        
        self.view.addSubview(lineChart)
    }
}
