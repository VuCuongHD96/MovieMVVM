//
//  NowMovieDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 8/28/21.
//

import UIKit

final class NowMovieDataSourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellWidth: CGFloat = 140
        static let cellHeight: CGFloat = 260
        static let spacing: CGFloat = 15
        static let movieArray = Array(repeating: Movie(), count: 8)
    }
    typealias MovieHandler = (Movie) -> Void
    
    // MARK: - Property
    var movieArray = [Movie]()
    var movieDidChoise: MovieHandler?
    weak var delegate: HomeDelegate?
    
    init(movieArray: [Movie]) {
        self.movieArray = movieArray
    }
    
    convenience override init() {
        self.init(movieArray: Constant.movieArray)
    }
}

extension NowMovieDataSourceDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        let movie = movieArray[row]
        let cell: NowCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: movie)
        return cell
    }
}

extension NowMovieDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
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
}

extension NowMovieDataSourceDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let movie = movieArray[row]
        delegate?.passMovie(movie)
    }
}
