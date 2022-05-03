//
//  ProfileView.swift
//  LearnPinFlexLayout
//
//  Created by Nicholas on 29/04/22.
//

import UIKit
import PinLayout
import FlexLayout

class ProfileView: UIView {
    private lazy var flexContainer = UIView()
    
    lazy var imageProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_pic")
//        imageView.pin.aspectRatio(1)
//        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var imageCircleContainer: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(named: ColorConstants.cherryRedDark)?.cgColor
        view.layer.borderWidth = 5.0
        return view
    }()
    
    lazy var nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Nicholas Kwan"
        label.font = UIFont.preferredFont(for: .title2, weight: .bold)
        return label
    }()
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.textColor = .secondaryLabel
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add corner radius to 2 bottom radiuses
        clipsToBounds = true
        layer.cornerRadius = 25
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        
        backgroundColor = UIColor(named: ColorConstants.orangeLight)
        
        // Add subviews and initialize flex layout
        addSubview(flexContainer)
//        flex.direction(.)
        flexContainer.flex.direction(.row).justifyContent(.center).padding(20).define { flex in
            flex.addItem(imageCircleContainer).direction(.row).alignItems(.center).justifyContent(.center).width(100).height(100).padding(10).define {
                $0.addItem(imageProfile)
            }
            flex.addItem().direction(.column).alignItems(.center).justifyContent(.center).paddingLeft(14).grow(1).define {
                $0.addItem(nameLbl)
                $0.addItem(titleLbl)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        flexContainer.pin.all()
        flexContainer.flex.layout(mode: .adjustHeight)
        
        imageCircleContainer.layer.cornerRadius = imageCircleContainer.frame.width / 2
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        imageProfile.clipsToBounds = true
        imageProfile.layer.masksToBounds = true
    }

}
