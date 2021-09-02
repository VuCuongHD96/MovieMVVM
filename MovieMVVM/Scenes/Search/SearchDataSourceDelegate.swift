//
//  SearchDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 9/2/21.
//

import UIKit

final class SearchDataSourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellWidth: CGFloat = 160
        static let cellHeight: CGFloat = 260
        static let spacing: CGFloat = 15
        static let insets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        static let movieArray = Array(repeating: Movie(), count: 8)
    }
    typealias MovieHandler = (Movie) -> Void
    
    // MARK: - Property
    var movieArray = [Movie]()
    var movieDidChoise: MovieHandler?
    
    init(movieArray: [Movie]) {
        self.movieArray = movieArray
    }
    
    convenience override init() {
        self.init(movieArray: Constant.movieArray)
    }
}

extension SearchDataSourceDelegate: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        let movie = movieArray[row]
        let cell: TopCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: movie)
        return cell
    }
}

extension SearchDataSourceDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let movie = movieArray[row]
        movieDidChoise?(movie)
    }
}

extension SearchDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.cellWidth, height: Constant.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constant.insets
    }
}
