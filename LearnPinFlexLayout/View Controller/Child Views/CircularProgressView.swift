//
//  CircularProgressView.swift
//  LearnPinFlexLayout
//
//  Created by Nicholas on 03/05/22.
//

import UIKit
import PinLayout

class CircularProgressView: UIView {
    var progressLayer = CAShapeLayer()
    var trackLayer = CAShapeLayer()
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Int(percentage * 100))%"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    var trackColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    let percentage: Double

    required init(percentage: Double) {
        self.percentage = percentage
        super.init(frame: CGRect(x: 5, y: 5, width: 75, height: 75))
        createCircularPath()
    }
    
    override init(frame: CGRect) {
        self.percentage = 0.5
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width / 2
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2),
            radius: (frame.size.width - 1.5) / 2,
            startAngle: CGFloat(-0.5 * .pi),
            endAngle: CGFloat(1.5 * .pi),
            clockwise: true
        )
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 6.0
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 6.0
        progressLayer.strokeEnd = percentage
        layer.addSublayer(progressLayer)
        
        addSubview(percentLabel)
    }
    
    // Initialize the percentage view
    override func layoutSubviews() {
        percentLabel.pin.all()
    }
}
