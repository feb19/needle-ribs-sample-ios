//
//  FeatureBComponent.swift
//  NeedleSampleApp
//
//  Created by nobuhiro.takahashi on 2022/04/07.
//

import NeedleFoundation
import UIKit

// MARK: -

// MARK: Builder

protocol FeatureBDependency: Dependency {}

protocol FeatureBBuilder {
    var viewController: UIViewController { get }
}

final class FeatureBComponent: Component<FeatureBDependency> {}

extension FeatureBComponent: FeatureBBuilder {
    var viewController: UIViewController {
        let router = FeatureBRouter()
        let interactor = FeatureBInteractor(router: router)
        let storyboard = UIStoryboard(name: "FeatureB", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController()
            as? FeatureBViewController else { return UIViewController() }
        viewController.interactor = interactor
        router.viewController = viewController
        return viewController
    }
}

// MARK: -

// MARK: Router

protocol FeatureBRouting {
    func dismiss()
}

final class FeatureBRouter: FeatureBRouting {
    weak var viewController: UIViewController?
    init() {}

    func dismiss() {
        viewController?.dismiss(animated: true)
    }
}

// MARK: -

// MARK: Interactor

protocol FeatureBInteracting {
    func dismiss()
}

final class FeatureBInteractor: FeatureBInteracting {
    private let router: FeatureBRouting
    init(router: FeatureBRouting) {
        self.router = router
    }

    func dismiss() {
        router.dismiss()
    }
}

// MARK: -

// MARK: View

final class FeatureBViewController: UIViewController {
    var interactor: FeatureBInteracting?
    @IBAction func dismissButtonWasTapped(_: UIButton) {
        interactor?.dismiss()
    }
}
