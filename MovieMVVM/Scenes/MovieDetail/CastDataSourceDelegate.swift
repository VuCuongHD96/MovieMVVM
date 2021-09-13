//
//  CastDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 9/13/21.
//

import UIKit

final class CastDataSourceDelegate: NSObject {
    
}

extension CastDataSourceDelegate: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
