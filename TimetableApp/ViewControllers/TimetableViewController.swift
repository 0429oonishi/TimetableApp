//
//  TimetableViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

final class TimetableViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var mondayView: NeumorphismView!
    @IBOutlet private weak var tuesdayView: NeumorphismView!
    @IBOutlet private weak var wednesdayView: NeumorphismView!
    @IBOutlet private weak var thursdayView: NeumorphismView!
    @IBOutlet private weak var fridayView: NeumorphismView!
    @IBOutlet private weak var saturdayView: NeumorphismView!
    @IBOutlet private weak var onePeriodView: NeumorphismView!
    @IBOutlet private weak var twoPeriodView: NeumorphismView!
    @IBOutlet private weak var threePeriodView: NeumorphismView!
    @IBOutlet private weak var fourPeriodView: NeumorphismView!
    @IBOutlet private weak var fivePeriodView: NeumorphismView!
    @IBOutlet private weak var sixPeriodView: NeumorphismView!

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

        setupCollectionView()
        setupWeekAndPeriodViews()
        
    }
    
}

// MARK: - setup
private extension TimetableViewController {
    
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
    
    func setupWeekAndPeriodViews() {
        mondayView.setupWeekAndPeriodView(weeks[0])
        tuesdayView.setupWeekAndPeriodView(weeks[1])
        wednesdayView.setupWeekAndPeriodView(weeks[2])
        thursdayView.setupWeekAndPeriodView(weeks[3])
        fridayView.setupWeekAndPeriodView(weeks[4])
        saturdayView.setupWeekAndPeriodView(weeks[5])
        onePeriodView.setupWeekAndPeriodView(periods[0])
        twoPeriodView.setupWeekAndPeriodView(periods[1])
        threePeriodView.setupWeekAndPeriodView(periods[2])
        fourPeriodView.setupWeekAndPeriodView(periods[3])
        fivePeriodView.setupWeekAndPeriodView(periods[4])
        sixPeriodView.setupWeekAndPeriodView(periods[5])
    }
    
}

private extension NeumorphismView {
    
    func setupWeekAndPeriodView(_ text: String) {
        self.type = .normal
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.setContentView(label)
        [label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ].forEach { $0.isActive = true }
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
        cell.delegate = self
        return cell
    }
    
}

extension TimetableViewController: TimetableCollectionViewCellDelegate {
    
    func myViewDidTapped() {
        
    }
    
}
