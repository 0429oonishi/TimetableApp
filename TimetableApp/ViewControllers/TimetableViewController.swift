//
//  TimetableViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

final class TimetableViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private var weekViews: [NeumorphismView]!
    @IBOutlet private var periodViews: [NeumorphismView]!
    
    private var weeks = Week.allCases.map { $0.rawValue }
    private var periods = Period.allCases.map { $0.rawValue }
    private var horizontalItemCount: Int { weeks.count }
    private var verticalItemCount: Int { periods.count }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TimetableCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: TimetableCollectionViewCell.identifier)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupWeekAndPeriodViews(weekViews, weeks)
        setupWeekAndPeriodViews(periodViews, periods)
        setupCollectionView()
        
    }
    
}

// MARK: - setup
private extension TimetableViewController {
    
    func setupWeekAndPeriodViews(_ views: [NeumorphismView], _ array: [String]) {
        views.enumerated().forEach { index, view in
            view.type = .normal
            let label = UILabel()
            label.text = String(array[index])
            label.textColor = .black
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 15)
            label.translatesAutoresizingMaskIntoConstraints = false
            view.setContentView(label)
            [label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ].forEach { $0.isActive = true }
        }
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let totalItemSize = CGSize(
            width: collectionView.bounds.width - layout.minimumInteritemSpacing * CGFloat(horizontalItemCount - 1),
            height: collectionView.bounds.height - layout.minimumLineSpacing * CGFloat(verticalItemCount - 1)
        )
        layout.itemSize = CGSize(
            width: totalItemSize.width / CGFloat(horizontalItemCount),
            height: totalItemSize.height / CGFloat(verticalItemCount)
        )
        collectionView.collectionViewLayout = layout
    }
    
}

extension TimetableViewController: UICollectionViewDelegate {
    
}

extension TimetableViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horizontalItemCount * verticalItemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimetableCollectionViewCell.identifier,
                                                      for: indexPath) as! TimetableCollectionViewCell
        return cell
    }
    
}
