//
//  MyTasksTitleView.swift
//  LearnPinFlexLayout
//
//  Created by Nicholas on 29/04/22.
//

import UIKit

class MyTasksTitleView: UIView {
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "My Tasks"
        label.font = UIFont.preferredFont(for: .title3, weight: .bold)
        return label
    }()
    
    lazy var calendarBtn: UIButton = {
        let image = UIImage(systemName: "calendar")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: ColorConstants.toscaGreenDark)
        
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.filled()
            config.buttonSize = .large
            config.cornerStyle = .capsule
            button.configuration = config
        } else {
            // Fallback on earlier versions
            
        }
        
//        button.backgroundColor = UIColor(named: ColorConstants.toscaGreenDark)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        flex.addItem().direction(.row).paddingHorizontal(20).paddingVertical(8).define { flex in
            flex.addItem(titleLbl).grow(1)
            flex.addItem(calendarBtn)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flex.layout(mode: .adjustHeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
