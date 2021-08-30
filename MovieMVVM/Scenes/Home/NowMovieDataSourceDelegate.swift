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
    }
}

extension NowMovieDataSourceDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NowCell = collectionView.dequeueReusableCell(for: indexPath)
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