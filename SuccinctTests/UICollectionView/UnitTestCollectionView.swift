import UIKit

final class UnitTestCollectionView: UICollectionView {
    private var configuration: UICollectionViewConfiguration!

    init(
        configuration: UICollectionViewConfiguration
    ) {
        self.configuration = configuration

        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

        register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: UICollectionViewCell.self)
        )

        dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource
extension UnitTestCollectionView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return configuration.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configuration.numberOfRows(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = String(describing: UICollectionViewCell.self)
        let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)

        configuration
            .cellDefinitions[indexPath]?
            .subviews
            .forEach { cell.addSubview($0) }
        
        return cell
    }
}
