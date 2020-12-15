//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by Екатерина Батеева on 10.12.2020.
//

import UIKit

class ResultsViewController: UIViewController {
  // 1. Передать сюда массив с ответами
  // 2. Определить наиболее часто встречающийся тип животного
  // 3. Отобразить результаты на экране
  // 4. Избавиться от кнопки возврата на предыдущий экран
  
  // MARK: IBOutlets
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var textLabel: UILabel!
  
  // MARK: Public properties
  public var answerChosen: [Answer] = []
  
  // MARK: Override methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.setHidesBackButton(true, animated: false)

    configureTitleAndLabel()
  }
  
  // MARK: Private methods
  private func configureTitleAndLabel() {
    let result = getFrequentlyAnimaalTypeFromAnswers()
    titleLabel.text = String(result.rawValue)
    textLabel.text = result.definition
  }
}

extension ResultsViewController {
  private func getFrequentlyAnimaalTypeFromAnswers() -> AnimalType {
    var animalTypesFromAnswers = [AnimalType: Int]()
    
    answerChosen.forEach { answer in
      animalTypesFromAnswers[answer.type] = (animalTypesFromAnswers[answer.type] ?? 0) + 1
    }

    return animalTypesFromAnswers.max(by: { (a, b) -> Bool in
      return a.value < b.value
    })!.key;
  }
}
