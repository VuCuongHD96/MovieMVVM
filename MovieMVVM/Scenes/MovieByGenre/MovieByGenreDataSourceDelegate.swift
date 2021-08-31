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
        static let cellHeight: CGFloat = 250
        static let movieArray = Array(repeating: Movie(), count: 3)
    }
    typealias MovieHandler = (_ movie: Movie) -> Void
    
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

extension MovieByGenreDataSourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let movie = movieArray[row]
        
        let cell: MovieByGenreCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setContent(data: movie)
        return cell
    }
}

extension MovieByGenreDataSourceDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let movie = movieArray[row]
        movieDidChoise?(movie)
    }
}
