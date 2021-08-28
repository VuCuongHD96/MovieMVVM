//
//  GenreDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 8/27/21.
//

import UIKit

final class GenreDataSourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 250
    }
    
    // MARK: - Property
    var genreArray = [Genre]()
    
    init(genreArray: [Genre]) {
        self.genreArray = genreArray
    }
}

extension GenreDataSourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let genre = genreArray[row]
        let cell: GenreImageCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: genre)
        return cell
    }
}

extension GenreDataSourceDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
}
