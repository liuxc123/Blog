//
//  ViewController.swift
//  RxSwiftLearn
//
//  Created by liuxc on 2019/9/30.
//  Copyright © 2019 liuxc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasicAction()

    }

    func setupBasicAction() {


        let ob = Observable<Any>.create { (observer) -> Disposable in
            observer.onNext("RxSwift框架")
            observer.onCompleted()
            return Disposables.create()
        }

        ob.subscribe(onNext: { (text) in
            print("订阅到：\(text)")
        }, onError: { (error) in
            print("error: \(error)")
        }, onCompleted: {
            print("完成")
        }, onDisposed: {
            print("销毁")
        })
        .disposed(by: disposeBag)
    }

}

