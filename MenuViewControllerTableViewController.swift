//
//  MenuViewControllerTableViewController.swift
//  Cathay
//
//  Created by Kong Yau Lee on 13/11/2021.
//

import UIKit

class MenuViewControllerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(Index, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    var Index = ["AsiaMilesRedeem","VIP","EachFlightCheaper!","EnjoyWeekend!","DisneyLand"]
    var MenuImages = ["AsiaMilesRedeem","VIP","EachFlightCheaper","EnjoyWeekend","DisneyLand"]
    
    enum Section {
        case all
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "datacell"
        
        let dataSource = UITableViewDiffableDataSource<Section, String>(
    tableView: tableView,
    cellProvider: { tableView,IndexPath, Index in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:IndexPath) as! MenuViewCellTableViewCell
        
            cell.NameLabel?.text = Index
        cell.imageView?.image = UIImage(named: self.MenuImages[IndexPath.row])

        
            return cell
            }
        )
        return dataSource
    }
    
    lazy var dataSource = configureDataSource()
    
    var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
