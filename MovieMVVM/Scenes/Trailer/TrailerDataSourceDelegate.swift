//
//  TrailerDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import UIKit

final class TrailerDataSourceDelegate: NSObject {
    
    // MARK: - Define
    struct Constant {
        static let cellWidth: CGFloat = 160
        static let cellHeight: CGFloat = 260
        static let insets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        static let trailerArray = Array(repeating: Trailer(), count: 5)
    }
    typealias TrailerHandler = (Trailer) -> Void
    
    // MARK: - Property
    var trailerArray = [Trailer]()
    var passTrailer: TrailerHandler?
    
    // MARK: - Init
    init(trailerArray: [Trailer]) {
        self.trailerArray = trailerArray
    }
    
    convenience override init() {
        self.init(trailerArray: Constant.trailerArray)
    }
}

extension TrailerDataSourceDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let trailer = trailerArray[row]
        let cell: TrailerCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: trailer)
        return cell
    }
}

extension TrailerDataSourceDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let trailer = trailerArray[row]
        passTrailer?(trailer)
    }
}
