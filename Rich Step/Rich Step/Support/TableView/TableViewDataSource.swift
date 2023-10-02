//
//  TableViewDataSource.swift
//  Rich Step
//
//  Created by Hanna on 30/09/23.
//

import UIKit

class TableViewDataSource: NSObject {
    
    // MARK: - Public properties
    weak var scrollDelegate: UIScrollViewDelegate?
    var tableView: UITableView? {
        didSet {
            _delegate = tableView?.delegate
            tableView?.delegate = self
            tableView?.dataSource = self
            registerNibs()
        }
    }
    
    var sections: [TableSectionProtocol] = [] {
        didSet {
            tableView?.reloadData()
            registerNibs()
        }
    }
    
    // MARK: - Private properties
    private weak var _delegate: UITableViewDelegate?
    private func registerNibs() {
        for section in sections {
            for _ in 0...section.itemsCount {
                tableView?.registerNib(section.cellType())
            }
        }
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension TableViewDataSource: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].itemsCount
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].headerView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].headerHeight()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].rowheight() ?? UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: section.cellType())
        section.configureCell(cell: cell, at: row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        sections[indexPath.section].didSelectAt(row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
