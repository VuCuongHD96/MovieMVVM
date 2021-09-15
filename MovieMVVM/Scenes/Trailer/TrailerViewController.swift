//
//  TrailerViewController.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import UIKit
import Reusable

final class TrailerViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: GradientButton!
    
    // MARK: - Property
    var viewModel: TrailerViewModelType! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        tableView.dataSource = viewModel.trailerDataSourceDelegate
    }
    
    // MARK: - Action
    @IBAction func closeAction(_ sender: Any) {
        viewModel.closeDidTap = Void()
    }
}

extension TrailerViewController: ViewControllerType {
  
    // MARK: - View
    func setupView() {
        tableView.register(cellType: TrailerCell.self)
        setupCloseButton()
    }
    
    private func setupCloseButton() {
        closeButton.title = "Close"
    }
    
    // MARK: - Data
    func setupData() {
        viewModel.showData()
    }
}

extension TrailerViewController: StoryboardSceneBased {
    
    static var sceneStoryboard = StoryBoard.trailer
}
