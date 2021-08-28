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
    typealias VoidHandler = () -> Void
    
    // MARK: - Property
    var genreArray = [Genre]()
    var cellDidTap: VoidHandler?
    
    init(genreArray: [Genre]) {
        self.genreArray = genreArray
    }
    
    // MARK: - View
    private func cellStartAnimation(cell: UITableViewCell) {
        UIView.animate(withDuration: 0.1) {
            cell.transform = .init(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                cell.transform = .identity
            } completion: { [weak self] _ in
                guard let self = self else { return }
                self.cellDidTap?()
            }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? GenreImageCell else {
            return
        }
        cellStartAnimation(cell: cell)
    }
}
