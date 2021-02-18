//
//  PokemonStatsCollectionViewCell.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//

import UIKit

class PokemonStatsCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableview: SelfSizedTableView!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var effortLabel: UILabel!
    @IBOutlet weak var cellBakcgroundContainerView: UIView!
    
    var viewModel: [PokemonStatsCollectionViewCellViewModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(viewModel: [PokemonStatsCollectionViewCellViewModel]){
        //base UI setup
        self.baseLabel.text = "pokemon.stat.base.label".localized
        self.effortLabel.text = "pokemon.stat.effort.label".localized
        
        self.viewModel = viewModel
        
        //tableview setup
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(cellType: PokemonStatTableViewCell.self)
        self.tableview.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(with: PokemonStatTableViewCell.self, for: indexPath)
        cell.setup(name: viewModel[indexPath.row].statName, base: viewModel[indexPath.row].base_stat, effort: viewModel[indexPath.row].effort)

        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellBakcgroundContainerView.layer.shadowOpacity = 0.15
        cellBakcgroundContainerView.layer.shadowOffset = CGSize(width: .zero, height: 5)
        cellBakcgroundContainerView.layer.shadowRadius = 22
        
    }

}

class SelfSizedTableView: UITableView {
  var maxHeight: CGFloat = UIScreen.main.bounds.size.height
  
  override func reloadData() {
    super.reloadData()
    self.invalidateIntrinsicContentSize()
    self.layoutIfNeeded()
  }
  
  override var intrinsicContentSize: CGSize {
    let height = min(contentSize.height, maxHeight)
    return CGSize(width: contentSize.width, height: height)
  }
}

class PokemonStatsCollectionViewCellViewModel {
    var base_stat : String?
    var effort : String?
    var statName : String?
    
    init(base_stat : String?, effort : String?, statName : String?) {
        self.base_stat = base_stat
        self.effort = effort
        self.statName = statName
    }
}
