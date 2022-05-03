//
//  TaskStatusView.swift
//  LearnPinFlexLayout
//
//  Created by Nicholas on 29/04/22.
//

import UIKit

enum TaskStatus: String {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
    
    func getImageIcon() -> UIImage? {
        switch self {
        case .todo:
            return UIImage(systemName: "clock")
        case .inProgress:
            return UIImage(systemName: "timer")
        case .done:
            return UIImage(systemName: "checkmark.circle")
        }
    }
    
    func getIconColor() -> UIColor? {
        switch self {
        case .todo:
            return UIColor(named: ColorConstants.cherryRedDark)
        case .inProgress:
            return UIColor(named: ColorConstants.orangeLight)
        case .done:
            return UIColor(named: ColorConstants.blueDark)
        }
    }
    
    func getTaskCountStarted() -> (Int, Int) {
        switch self {
        case .todo:
            return (5, 1)
        case .inProgress:
            return (1, 1)
        case .done:
            return (18, 13)
        }
    }
}

class TaskStatusView: UIView {
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = taskStatus.getImageIcon()
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var iconContView: UIView = {
        let view = UIView()
        view.backgroundColor = taskStatus.getIconColor()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = taskStatus.rawValue
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let countTasks = taskStatus.getTaskCountStarted()
        let label = UILabel()
        label.text = "\(countTasks.0) task\(countTasks.0 > 1 ? "s" : "") now. \(countTasks.1) started"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        return label
    }()
    
    let taskStatus: TaskStatus

    required init(with status: TaskStatus) {
        self.taskStatus = status
        super.init(frame: .zero)
        layoutViews()
    }
    
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
     */
    
    func layoutViews() {
        flex.addItem().direction(.row).paddingHorizontal(20).paddingVertical(10).define {
            $0.addItem(iconContView).direction(.column).alignItems(.center).justifyContent(.center).aspectRatio(1).padding(10).define {
                $0.addItem(iconImage)
            }
            $0.addItem().direction(.column).paddingLeft(14).grow(1).define {
                $0.addItem(titleLabel)
                $0.addItem(subtitleLabel)
            }
        }
    }
    
    override func layoutSubviews() {
        flex.layout(mode: .adjustHeight)
        iconContView.layer.cornerRadius = iconContView.frame.width / 2
    }
    
    func setStatusReport(_ status: TaskStatus) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
