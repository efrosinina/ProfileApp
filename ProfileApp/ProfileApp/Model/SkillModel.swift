//
//  SkillModel.swift
//  ProfileApp
//
//  Created by Елизавета Ефросинина on 01/08/2023.
//

import Foundation

final class SkillModel {
    //MARK: -- Singleton
    static var shared = SkillModel()
    private init() {
        configureSkills()
    }
    
    //MARK: -- Properties
    var skills: [Skill] = []
    
    //MARK: -- Methods
    private func configureSkills() {
        skills = [
            Skill(title: "MVI/MWWM"),
            Skill(title: "Kotlin Coroutines"),
            Skill(title: "DataSource"),
            Skill(title: "OkHttp"),
            Skill(title: "ООП и SOLID")
        ]
    }
}
