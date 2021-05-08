//
//  TimetableViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

final class TimetableViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var saturdaySuperView: UIView!
    @IBOutlet private weak var sixPeriodSuperView: UIView!
    
    private var weeks = Week.data
    private var periods = Period.data
    private var horizontalItemCount: Int { weeks.count }
    private var verticalItemCount: Int { periods.count }
    private let lectureUseCase = LectureUseCase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TimetableCollectionViewCell.nib,
                                forCellWithReuseIdentifier: TimetableCollectionViewCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTimetable()
        collectionView.reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCollectionView()
        
    }
    
}

// MARK: - setup
private extension TimetableViewController {
    
    func setupTimetable() {
        let isHiddenSaturdayView = !UserDefaults.standard.bool(forKey: .isHiddenSaturdayViewKey)
        if weeks.contains(.saturday) == isHiddenSaturdayView {
            saturdaySuperView.isHidden = isHiddenSaturdayView
            weeks = isHiddenSaturdayView ? weeks.filter { $0 != .saturday } : weeks + [.saturday]
        }
        let isHiddenSixPeriodView = !UserDefaults.standard.bool(forKey: .isHiddenSixPeriodViewKey)
        if periods.contains(.six) == isHiddenSixPeriodView {
            sixPeriodSuperView.isHidden = isHiddenSixPeriodView
            periods = isHiddenSixPeriodView ? periods.filter { $0 != .six } : periods + [.six]
        }
        
        for _ in 0..<horizontalItemCount * verticalItemCount {
            if lectureUseCase.readAll().count < horizontalItemCount * verticalItemCount {
                lectureUseCase.create(Lecture())
            }
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

// MARK: - UICollectionViewDelegate
extension TimetableViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension TimetableViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horizontalItemCount * verticalItemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimetableCollectionViewCell.identifier,
                                                      for: indexPath) as! TimetableCollectionViewCell
        let hasSaturday = weeks.contains(.saturday)
        guard let week = Week(item: indexPath.item, hasSaturday: hasSaturday) else { fatalError() }
        guard let period = Period(item: indexPath.item, hasSaturday: hasSaturday) else { fatalError() }
        cell.setup(week: week, period: period) { [weak self] in
            self?.presentSettingLectureVC(week: week, period: period)
        }
        return cell
    }
    
    private func presentSettingLectureVC(week: Week, period: Period) {
        let settingLectureVC = UIStoryboard.settingLecture.instantiateViewController(
            identifier: SettingLectureViewController.identifier
        ) as! SettingLectureViewController
        settingLectureVC.modalPresentationStyle = .overCurrentContext
        self.view.layer.opacity = 0.6
        settingLectureVC.week = week
        settingLectureVC.period = period
        settingLectureVC.backButtonEvent = { self.view.layer.opacity = 1 }
        present(settingLectureVC, animated: true, completion: nil)
    }
    
}

private extension Week {
    init?(item: Int, hasSaturday: Bool) {
        let horizontalItemCount = hasSaturday ? 6 : 5
        self.init(rawValue: item % horizontalItemCount)
    }
}

private extension Period {
    init?(item: Int, hasSaturday: Bool) {
        let horizontalItemCount = hasSaturday ? 6 : 5
        self.init(rawValue: item / horizontalItemCount)
    }
}
