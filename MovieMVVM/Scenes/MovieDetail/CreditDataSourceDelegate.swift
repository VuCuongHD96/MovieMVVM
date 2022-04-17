//
//  CreditDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 9/13/21.
//

import UIKit

final class CreditDataSourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellHeight: CGFloat = 128
        static let cellWidth: CGFloat = 80
    }
    
    // MARK: - Property
    var creditResponse = CreditResponse()
    
    init(creditResponse: CreditResponse) {
        self.creditResponse = creditResponse
    }
}

extension CreditDataSourceDelegate: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let personArray = creditResponse.personArray
        return personArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let personArray = creditResponse.personArray
        let person = personArray[indexPath.row]
        let cell: CreditCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setContent(person: person)
        return cell
    }
}

extension CreditDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.cellWidth, height: Constant.cellHeight)
    }
}
