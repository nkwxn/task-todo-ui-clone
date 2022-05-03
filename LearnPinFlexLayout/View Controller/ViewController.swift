//
//  ViewController.swift
//  LearnPinFlexLayout
//
//  Created by Nicholas on 28/04/22.
//

import UIKit
import Alamofire
import FlexLayout
import PinLayout

struct Task {
    let title: String
    let progressHours: Double
    let percentage: Double
    let colorName: String
}

class ViewModel {
    let projects: [Task] = [
        Task(
            title: "Medical App",
            progressHours: 9.0,
            percentage: 0.25,
            colorName: ColorConstants.toscaGreenDark
        ),
        Task(
            title: "History Notes",
            progressHours: 20.0,
            percentage: 0.6,
            colorName: ColorConstants.cherryRedDark
        ),
        Task(
            title: "News Classifier",
            progressHours: 9.0,
            percentage: 0.25,
            colorName: ColorConstants.orangeLight
        ),
        Task(
            title: "Invoice Recognizer",
            progressHours: 9.0,
            percentage: 0.25,
            colorName: ColorConstants.blueDark
        ),
    ]
}

class ViewController: UIViewController {
    lazy var flexContainer = UIView()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var profileView: ProfileView = {
        let view = ProfileView()
        return view
    }()
    
    lazy var taskTitle = MyTasksTitleView()
    
    lazy var activeProjectsLbl: UILabel = {
        let label = UILabel()
        label.text = "Active Projects"
        label.font = UIFont.preferredFont(for: .title3, weight: .bold)
        return label
    }()
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: ColorConstants.yellowLight)
        //        view.addSubview(profileView)
        view.addSubview(scrollView)
//        title = "Trying out pin layout"
        if #available(iOS 14.0, *) {
            self.navigationItem
                .setLeftBarButton(
                    UIBarButtonItem(
                        title: "Menu",
                        image: UIImage(systemName: "line.3.horizontal"),
                        primaryAction: nil,
                        menu: nil
                    ),
                    animated: true
                )
            self.navigationItem
                .setRightBarButton(
                    UIBarButtonItem(
                        title: "Search",
                        image: UIImage(systemName: "magnifyingglass"),
                        primaryAction: nil,
                        menu: nil
                    ), animated: true
                )
        } else {
            // Fallback on earlier versions
            self.navigationItem.setLeftBarButton(
                UIBarButtonItem(image: UIImage(named: "line.3.horizontal"), style: .plain, target: nil, action: nil),
                animated: true
            )
            self.navigationItem
                .setRightBarButton(
                    UIBarButtonItem(
                        image: UIImage(systemName: "magnifyingglass"),
                        style: .plain,
                        target: nil,
                        action: nil
                    ), animated: true
                )
        }
        scrollView.addSubview(flexContainer)
        flexContainer.flex.direction(.column).justifyContent(.center).alignItems(.stretch).define { flex in
            flex.addItem(profileView)
            flex.addItem(taskTitle)
            flex.addItem(TaskStatusView(with: .todo))
            flex.addItem(TaskStatusView(with: .inProgress))
            flex.addItem(TaskStatusView(with: .done))
            flex.addItem().padding(20).direction(.row).justifyContent(.start).alignItems(.stretch).define {
                $0.addItem(activeProjectsLbl)
            }
            
            for i in 0..<((viewModel.projects.count + 1) / 2) {
                flex.addItem().paddingHorizontal(20).paddingBottom(20).direction(.row).alignItems(.start).justifyContent(.spaceBetween).define {
                    for j in 0...1 {
                        let cardView = ProjectCardView(with: viewModel.projects[(i * 2) + j])
                        cardView.flex.width(view.frame.width / 2 - 30)
//                        cardView.frame.width = view.frame.width / 2 - 50
                        $0.addItem(cardView)
                    }
                }
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.pin.all()
        flexContainer.flex.layout(mode: .adjustHeight)
        flexContainer.pin.top().horizontally()
        profileView.pin.height(140).width(view.safeAreaLayoutGuide.layoutFrame.width)
//        taskTitle.pin.width(view.safeAreaLayoutGuide.layoutFrame.width)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: flexContainer.frame.height)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Is scrolling")
    }
}
