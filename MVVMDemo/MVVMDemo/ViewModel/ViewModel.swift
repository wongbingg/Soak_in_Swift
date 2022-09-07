//
//  ViewModel.swift
//  MVVMDemo
//
//  Created by 이원빈 on 2022/09/04.
//

protocol ViewModelProtocol: AnyObject {
    func didUpdateModel()
}

final class ViewModel {
    weak var delegate: ViewModelProtocol?
//    private var models: [Model] = []
    private var models: [Model] {
        didSet {
            self.modelChanged?()
        }
    }
    var modelChanged: (() -> ())? // 바인딩 closure 구현
    
    init(models: [Model]) {
        self.models = models
    }
}

extension ViewModel {
    
    func create(with model: Model) {
        models.append(model)
        delegate?.didUpdateModel()
    }
    
    func read() -> [Model] {
        return models
    }
    
    func delete(model: Model) {
        guard let index = models.firstIndex(of: model) else { return }
        models.remove(at: index)
        delegate?.didUpdateModel()
    }
}
