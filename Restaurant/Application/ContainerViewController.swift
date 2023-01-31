//
//  ContainerViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit

final class ContainerViewController: UIViewController, MainScreenViewControlerDelegate {
    var controller: UIViewController!
    var leftMenuViewController: LeftMenuViewController!
    var isMove = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainScreenViewController()
    }

    private func configureMainScreenViewController() {
        let mainScreenViewController = MainScreenViewControler()
        mainScreenViewController.delegate = self
        controller = mainScreenViewController
        view.addSubview(controller.view)
        addChild(controller)
    }

    private func configureLeftMenuViewController() {
        if leftMenuViewController == nil {
            leftMenuViewController = LeftMenuViewController()
            view.insertSubview(leftMenuViewController.view, at: 0)
            addChild(leftMenuViewController)
        }
    }

    private func showMenuViewController(shouldmove: Bool) {
        if shouldmove {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                self.controller.view.frame.origin.x = self.controller.view.frame.width - 40
            }) { (finished) in

            }
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                self.controller.view.frame.origin.x = 0
            }) { (finished) in

            }
        }
    }

    //MARK: - MainScreenViewControlerDelegate

    func toggleMenu() {
        configureLeftMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldmove: isMove)
    }
}
