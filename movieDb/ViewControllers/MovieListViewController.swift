//
//  ViewController.swift
//  movieDb
//
//  Created by swetha on 10/21/21.
//  Copyright © 2021 swetha. All rights reserved.

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let moviesViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Popular Movies"

        getPopularMovies()
    }

    func getPopularMovies() {
        moviesViewModel.discoverPopularMovies() { statusValue in
            if statusValue == status.success {
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            }
        }
    }
}

//MARK: TableView Datasource & Delegates
extension MovieListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.moviesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        viewHeader.backgroundColor = .clear
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 10))
        viewFooter.backgroundColor = .clear
        return viewFooter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let dataItemList = moviesViewModel.moviesList[indexPath.row]
        movieCell.set(viewModel: dataItemList)

        return movieCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "MovieDetailsVC") as! MovieDetailsVC
        movieDetailsVC.movieInfo = moviesViewModel.moviesList[indexPath.row]
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !moviesViewModel.isLoadingNews){
            if moviesViewModel.currentPage < moviesViewModel.totalPages {
                getPopularMovies()
            }
        }
    }
}

