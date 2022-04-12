//
//  RootComponent.swift
//  NeedleSampleApp
//
//  Created by nobuhiro.takahashi on 2022/04/07.
//

import NeedleFoundation

final class RootComponent: BootstrapComponent {
    var featureABuilder: FeatureABuilder { FeatureAComponent(parent: self) }
    var featureBBuilder: FeatureBBuilder { FeatureBComponent(parent: self) }
}
