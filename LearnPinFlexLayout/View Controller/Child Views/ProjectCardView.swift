//
//  ProjectCardView.swift
//  LearnPinFlexLayout
//
//  Created by Nicholas on 30/04/22.
//

import UIKit
import PinLayout
import FlexLayout

class ProjectCardView: UIView {
    lazy var projectCardContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: task.colorName)
        return view
    }()
    
    lazy var circularProgressView: CircularProgressView = {
        let view = CircularProgressView(percentage: task.percentage)
        view.trackColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        view.progressColor = .white
        return view
    }()
    
    lazy var projectTitleLabel: UILabel = {
        let label = UILabel()
        label.text = task.title
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var progressHoursLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Int(task.progressHours)) hour\(task.progressHours > 1 ? "s" : "") progress"
        label.textColor = .systemGray5
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        return label
    }()
    
    let task: Task
    
    required init(with project: Task) {
        self.task = project
        super.init(frame: .zero)
        createViewLayout()
    }
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViewLayout()
    }
     */
    
    func createViewLayout() {
        self.addSubview(projectCardContainer)
        projectCardContainer.flex.direction(.column).padding(15).define {
            $0.addItem().direction(.row).alignItems(.start).justifyContent(.start).padding(10).define {
                $0.addItem(circularProgressView).marginBottom(20)
            }
            $0.addItem(projectTitleLabel)
            $0.addItem(progressHoursLabel)
        }
    }
    
    override func layoutSubviews() {
        projectCardContainer.pin.all()
        projectCardContainer.flex.layout(mode: .adjustHeight)
        projectCardContainer.layer.cornerRadius = 30
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
