//
//  MovieByGenreDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import UIKit

final class MovieByGenreDataSourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 280
    }
    
}

extension MovieByGenreDataSourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieByGenreCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension MovieByGenreDataSourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
}
