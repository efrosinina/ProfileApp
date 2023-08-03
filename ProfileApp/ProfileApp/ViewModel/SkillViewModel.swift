//
//  SkillViewModel.swift
//  ProfileApp
//
//  Created by Елизавета Ефросинина on 03/08/2023.
//

import Foundation

protocol SkillViewModelProtocol {
    var numberOfSkills: Int { get }
    
    func getSkill(for row: Int) -> Skill
    func appendSkill(text: String)
    func removeSkill(text: String)
}

class SkillViewModel: SkillViewModelProtocol {
    //MARK: -- Properties
    var skills: [Skill] = []
    
    var numberOfSkills: Int {
        skills.count
    }
    //MARK: -- Initialization
    init() {
        configureSkills()
    }
    
    //MARK: -- Methods
    func configureSkills() {
        skills = [
            Skill(title: "MVI/MVVM"),
            Skill(title: "Kotlin Coroutines"),
            Skill(title: "DataSource"),
            Skill(title: "OkHttp"),
            Skill(title: "ООП и SOLID")
        ]
    }
    
    //MARK: -- Private Methods
    func getSkill(for row: Int) -> Skill {
        let skill = skills[row]
        return skill
    }
    
    func appendSkill(text: String) {
        skills.append(Skill(title: text))
    }
    
    func removeSkill(text: String) {
        skills.removeAll(where: { $0.title == text })
    }
}
