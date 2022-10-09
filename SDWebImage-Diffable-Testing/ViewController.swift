//
//  ViewController.swift
//  SDWebImage-Diffable-Testing
//
//  Created by Eilon Krauthamer on 06/10/2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    typealias DataSource = UITableViewDiffableDataSource<Section, Item.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item.ID>
    
    /// Set to true to visualize the data source's `reloadItems` pattern
    static let delayedCellConfiguration = true
    
    enum Section {
        case main
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ViewModel()
    lazy var dataSource = createDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
       
        updateSnapshot()
    }
    
    func createDataSource() -> DataSource {
        DataSource(tableView: tableView) { [weak self] tableView, indexPath, itemIdentifier in
            guard let item = self?.viewModel.data[itemIdentifier] else {
                fatalError()
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
            if ViewController.delayedCellConfiguration {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    cell.setup(item: item, isSelected: self?.viewModel.selectedItemIdentifiers.contains(itemIdentifier) == true)
                }
            } else {
                cell.setup(item: item, isSelected: self?.viewModel.selectedItemIdentifiers.contains(itemIdentifier) == true)
            }
            return cell
        }
    }

    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(Item.dataSource.map(\.id), toSection: .main)
        dataSource.apply(snapshot)
    }
    
    func reloadAllItems() {
        var snapshot = dataSource.snapshot()
        let reloadedItems = snapshot.itemIdentifiers
        snapshot.reloadItems(reloadedItems)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    @IBAction func reloadTapped(_ sender: Any) {
        reloadAllItems()
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        guard let itemIdentifier = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        if viewModel.selectedItemIdentifiers.contains(itemIdentifier) {
            viewModel.selectedItemIdentifiers.remove(itemIdentifier)
        } else {
            viewModel.selectedItemIdentifiers.insert(itemIdentifier)
        }
        
        reloadAllItems()
    }
}

