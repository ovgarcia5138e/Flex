//
//  weightTrackerController.swift
//  Flex
//
//  Created by Oscar Garcia Vazquez on 11/15/20.
//

import UIKit
import Charts

protocol GetChartData {
    func getChartData(with dataPoints: [String], values: [String])
    var workoutDuration : [String] { get set }
    var beatsPerMinute : [String] { get set }
}

class WeightTrackerController : UIViewController {
    // MARK: - Properties
    
    var workoutDuration = [String]()
    var beatsPerMinute = [String]()
    
    private let weieghtLabel : UILabel = {
        let label = UILabel()
        label.text = "187.54"
        label.font = UIFont.systemFont(ofSize: 50, weight: .black)
        label.backgroundColor = .brown
        label.textAlignment = .center
        
        return label
    }()
    
    private let weightTF : UITextField = {
        let tf = Utilities().textField(with: "Enter Weight in lbss")
        tf.backgroundColor = .cyan
        
        return tf
    }()
    
    private let submitWeightBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Submit", for: .normal)
        btn.addTarget(self, action: #selector(handleSubmitWeightTapped), for: .touchUpInside)
        btn.layer.cornerRadius = 20
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.white.cgColor
        
        return btn
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        configureUI()
    }
    
    func configureUI() {
        configureWeightInputs()
        configureSubmitBtn()
    }
    
    func configureWeightInputs() {
        let stack = UIStackView(arrangedSubviews: [weieghtLabel, weightTF])
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 0
        
        view.addSubview(stack)
        stack.frame = CGRect(x: 10, y: view.frame.height * 0.50, width: view.frame.width - 20, height: view.frame.height * 0.25)
    }
    
    func configureSubmitBtn() {
        view.addSubview(submitWeightBtn)
        submitWeightBtn.frame = CGRect(x: (view.frame.width / 2) - 50,
                                       y: view.frame.height * 0.80,
                                       width: 100, height: 50)
    }
    
    func populateChartData() {
        workoutDuration = ["123", "143", "137", "150", "132"]
        beatsPerMinute = ["12", "23", "54", "45", "89"]
        
        self.getChartData(with: workoutDuration, values : beatsPerMinute)
    }
    
    func lineChart() {
        let lineChart = lineChart(frame: CGRect(x: 0, y: 45, width: view.frame.width, height: view.frame.height * 0.45))
        lineChart.delegate = self
        view.addSubview(lineChart)
    }
    
    
    // MARK: - Helpers
    
    // MARK: - Selectors
    
    @objc func handleSubmitWeightTapped() {
        print("DEBUG: Submit pressed")
        weieghtLabel.text = "\(weightTF.text!) lbs"
        weightTF.text = ""
    }
    
    // MARK: - API
}

extension WeightTrackerController : GetChartData {
    func getChartData(with dataPoints: [String], values: [String]) {
        
    }
}

public class ChartFormatter : NSObject, IAxisValueFormatter {
    var workoutDuration = [String]()
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return workoutDuration[Int(value)]
    }
    
    public func setValues(values : [String]) {
        self.workoutDuration = values
    }
}
