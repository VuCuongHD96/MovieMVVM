//
//  GenreDataSourceDelegate.swift
//  MovieMVVM
//
//  Created by admin on 8/27/21.
//

import UIKit

final class GenreDataSourceDelegate: NSObject {
    
}

extension GenreDataSourceDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .green
        return cell
    }
}

extension GenreDataSourceDelegate: UITableViewDelegate {
    
}
