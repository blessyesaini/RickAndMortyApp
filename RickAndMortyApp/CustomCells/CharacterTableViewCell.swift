//
//  CharacterTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Blessy Elizabeth Saini on 25/04/2022.
//

import UIKit

struct CharacterTableViewCellModel {
    let id: Int?
    let name: String?
    let value: String?
    let imageURL: String?
}

class CharacterTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var noOfEpisodesValueLabel: UILabel!
    
    //MARK: - Properties
    var data: CharacterTableViewCellModel? {
        didSet {
            loadData()
        }
    }
    static let reuseIdentifier = "CharacterTableViewCell"
    
    //MARK: - Custom Methods
    func loadData() {
        self.nameLabel.text = data?.name
        self.noOfEpisodesValueLabel.text = data?.value
        self.characterImageView.downloaded(from: data?.imageURL ?? "")
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
