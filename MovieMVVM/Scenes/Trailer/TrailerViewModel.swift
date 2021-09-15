//
//  TrailerViewModel.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import Foundation

protocol TrailerViewModelType {
    
    // MARK: - Define
    typealias Listener = (TrailerViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var trailerDataSourceDelegate: TrailerDataSourceDelegate! { get }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var closeDidTap: Void { get set }
}

final class TrailerViewModel: TrailerViewModelType {
    
    // MARK: - Property
    let navigator: TrailerNavigatorType
    let useCase: TrailerUseCaseType
    
    init(navigator: TrailerNavigatorType, useCase: TrailerUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    var dataDidChange: Listener?
    var trailerDataSourceDelegate: TrailerDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    var isFoundMovie = false
    
    // MARK: - Data
    func showData() {
        trailerDataSourceDelegate = TrailerDataSourceDelegate()
        trailerDataSourceDelegate.passTrailer = { [weak self] trailer in
            guard let self = self else { return }
            self.navigator.toVideoScreen(with: trailer)
        }
    }
    
    // MARK: - Action
    var closeDidTap: Void {
        didSet {
            navigator.dismissView()
        }
    }
}
