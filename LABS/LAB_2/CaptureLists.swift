//
//  CaptureLists.swift
//  LABS
//
//  Created by Ilya Murashko on 26.02.2022.
//

import Foundation

// Вы пытаетесь переспорить Шелдона, чье любимое число круче.
// Сейчас, какое бы число вы не загадали, Шелдон вас переспорит.
// Ваша задача - внимательно посмотреть на код и грамотно модернизировать замыкание setValueInFavouriteNumber.

// Подсказка: используйте capture list

// Решение кратко обоснуйте в блоке | Обоснование решения |.
// Например: /* Я сделал …, т.к. это красиво */

/* у нас получается цикл сильных ссылок -> утечка памяти, проще использовать unowned, так как self не будет  nil (опциональность нам здесь не нужна)    */


final class CaptureLists {
    
    var favouriteNumber = 0
    
    func disputeWithSheldonCooper(myFavouriteNumber: Int) {
         var number = myFavouriteNumber
        
        let setValueInFavouriteNumber: () -> () = {[unowned self, number] in  // ну или [weak self, number] self?.fav...
            self.favouriteNumber = number
        }
        
        let convertToSheldonsFavoriteNumberIfNeeded: () -> () = { 
            guard number == 73 else {
                number = 73
                return
            }
        }
        
        convertToSheldonsFavoriteNumberIfNeeded()
        setValueInFavouriteNumber()
    }
}
