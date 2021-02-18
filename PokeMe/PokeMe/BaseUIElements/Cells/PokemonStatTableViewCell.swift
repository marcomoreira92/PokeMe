//
//  PokemonStatTableViewCell.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//

import UIKit

class PokemonStatTableViewCell: UITableViewCell {

    @IBOutlet weak var statNameLabel: UILabel!
    @IBOutlet weak var statBaseLabel: UILabel!
    @IBOutlet weak var statEffortLabel: UILabel!
    
    func setup(name: String?, base: String?, effort: String?){
        self.statNameLabel.text = name
        self.statBaseLabel.text = base
        self.statEffortLabel.text = effort
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
