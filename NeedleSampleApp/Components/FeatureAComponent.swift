//
//  FeatureAComponent.swift
//  NeedleSampleApp
//
//  Created by nobuhiro.takahashi on 2022/04/07.
//

import NeedleFoundation
import SwiftUI
import UIKit

// MARK: -

// MARK: Builder

protocol FeatureADependency: Dependency {
    var featureBBuilder: FeatureBBuilder { get }
}

protocol FeatureABuilder {
    var viewController: UIViewController { get }
}

final class FeatureAComponent: Component<FeatureADependency> {}
extension FeatureAComponent: FeatureABuilder {
    var viewController: UIViewController {
        let navigationController = UINavigationController()
        let router = FeatureARouter(viewController: navigationController,
                                    featureBBuilder: dependency.featureBBuilder)
        let interactor = FeatureAInteractor(router: router)
        let viewController = FeatureAViewController(interactor: interactor)
        navigationController.viewControllers = [viewController]
        return navigationController
    }
}

// MARK: -

// MARK: Router

protocol FeatureARouting {
    func showFeatureB()
}

final class FeatureARouter: FeatureARouting {
    private weak var viewController: UIViewController?
    private let featureBBuilder: FeatureBBuilder
    init(viewController: UIViewController, featureBBuilder: FeatureBBuilder) {
        self.viewController = viewController
        self.featureBBuilder = featureBBuilder
    }

    func showFeatureB() {
        guard let viewController = viewController else { return }
        viewController.present(featureBBuilder.viewController, animated: true)
    }
}

// MARK: -

// MARK: Interactor

protocol FeatureAInteracting {
    func showFeatureB()
}

final class FeatureAInteractor: FeatureAInteracting {
    private let router: FeatureARouting
    init(router: FeatureARouting) {
        self.router = router
    }

    func showFeatureB() {
        router.showFeatureB()
    }
}

// MARK: -

// MARK: View

final class FeatureAViewController: UIHostingController<FeatureAView> {
    private let interactor: FeatureAInteracting
    init(interactor: FeatureAInteracting) {
        let view = FeatureAView(interactor: interactor)
        self.interactor = interactor
        super.init(rootView: view)
    }

    @available(*, unavailable)
    @MainActor @objc dynamic required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct FeatureAView: View {
    let interactor: FeatureAInteracting?
    var body: some View {
        Button {
            guard let interactor = self.interactor else { return }
            interactor.showFeatureB()
        } label: {
            Text("B 画面開けるかな 🤔")
        }.padding()
    }
}
