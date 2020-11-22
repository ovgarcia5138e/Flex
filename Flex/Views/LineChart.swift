//
//  LineChart.swift
//  Flex
//
//  Created by Oscar Garcia Vazquez on 11/21/20.
//

import UIKit
import Charts

class LineChart : UIView {
    let lineChartView = LineChartView()
    var lineDataEntry : [ChartDataEntry] = []
    
    var workoutDuration = [String]()
    var beatsPerMinute = [String]()
    
    var delegate : GetChartData {
        didSet {
            populateData()
            lineChartSetUp()
        }
    }
    
    func populateData() {
        workoutDuration = delegate.workoutDuration
        beatsPerMinute = delegate.beatsPerMinute
    }
    
    func lineChartSetUp() {
        self.backgroundColor = UIColor.white
        self.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        lineChartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        lineChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInSine)
        
        setLineChart(dataPoints: workoutDuration, values: beatsPerMinute)
        
    }
    
    func setLineChart(dataPoints : [String], values: [String]) {
        lineChartView.noDataTextColor = UIColor.white
        lineChartView.noDataText = "No data for the chart"
        lineChartView.backgroundColor = UIColor.white
        
        for i in 0..<dataPoints.count {
            let dataPoint = ChartDataEntry(x: Double(), y: Double(values[i])!)
            lineDataEntry.append(dataPoint)
        }
        
        let chartDataSet = LineChartDataSet(entries: lineDataEntry, label: "BPM")
        let chartData = LineChartData()
        chartData.addDataSet(chartDataSet)
        chartData.setDrawValues(true)
        chartDataSet.colors = [UIColor.purple]
        chartDataSet.setCircleColor(UIColor.purple)
        chartDataSet.circleHoleColor = UIColor.purple
        chartDataSet.circleRadius = 4.0
        
        let gradientColros = [UIColor.purple.cgColor, UIColor.clear.cgColor] as CFArray
        let colorLocations : [CGFloat] = [1.0, 0.0]
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColros, locations: colorLocations) else {
            print("gradient error"); return }
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        chartDataSet.drawFilledEnabled = true
        
        let formatter : ChartFormatter = ChartFormatter()
        formatter.setValues(values: dataPoints)
        let xaxis : XAxis = XAxis()
        xaxis.valueFormatter = formatter
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.valueFormatter = xaxis.valueFormatter
        lineChartView.chartDescription?.enabled = false
        lineChartView.legend.enabled = true
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = true
        
        lineChartView.data = chartData
    }
}
