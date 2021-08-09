//
//  ListViewController.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import UIKit

protocol ListViewControllerDelegate: AnyObject {
    func showAlert(title: String, message: String, errorHandler: @escaping () -> ())
    func didSelectDatum(_ datum: Datum)
}

final class ListViewController: UIViewController {
    
    // MARK: - Public properties -
    
    weak var delegate: ListViewControllerDelegate?
    
    // MARK: - Private properties -
    
    private let viewModel: ListViewModelProtocol
    private let contentView = ListView()
    
    // MARK: - Lifecycle -
    
    init(viewModel: ListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchData()
    }
    
    // MARK: - Setup view -
    
    private func setupView() {
        title = "Endpoint data"
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(ListItemTableViewCell.self, forCellReuseIdentifier: ListItemTableViewCell.className)
    }
    
    // MARK: - Data methods -
    
    private func fetchData() {
        contentView.showActivityIndicator(true)
        
        viewModel.fetchData { [weak self] errorText in
            DispatchQueue.main.async {
                self?.contentView.showActivityIndicator(false)
                
                if let errorText = errorText {
                    self?.delegate?.showAlert(
                        title: "Data dwonloading problem!",
                        message: errorText,
                        errorHandler: {
                            self?.fetchData()
                        })
                } else {
                    self?.contentView.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - TableView data source methods -

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentView.tableView.dequeueReusableCell(withIdentifier: ListItemTableViewCell.className, for: indexPath) as? ListItemTableViewCell
        else { return UITableViewCell() }
        let cellText = viewModel.getTextForCell(atIndex: indexPath.row)
        cell.configure(withText: cellText)
        return cell
    }
}

// MARK: - TableView delegate methods -

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let datum = viewModel.data[indexPath.row]
        delegate?.didSelectDatum(datum)
    }
}
