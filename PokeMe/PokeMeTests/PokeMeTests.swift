//
//  PokeMeTests.swift
//  PokeMeTests
//
//  Created by mmalaqui on 12/02/2021.
//

import XCTest
@testable import PokeMe

class PokeMeTests: XCTestCase {

    var pokemonCDL : CDLPokemon!
    
    override func setUp(){
        pokemonCDL = CDLPokemon()
    }

    func test_cdl_pokemon_by_id() throws {
        let expectation = XCTestExpectation(description: "calls CDL layer for specific pokemon")

        pokemonCDL.getPokemonByID(pokemonID: "1", subscriber: ("CDLtest", { ( response: CDLResponse? ) -> Void in
            if let response = response {
                switch response {
                case .failure(let error):
                    XCTAssert(false, error.description)
                    break
                case .success(let model):
                    if let model = model as? CDLPokemonModel {
                        XCTAssert(model.name == "bulbasaur")
                    }else{
                        XCTAssert(false, "model is not compatible with CDL pokemon")
                    }
                   
                    break
                }
            }else{
                XCTAssert(false, "no response avaliable")
            }
            expectation.fulfill()
        }))
        wait(for: [expectation], timeout: 1)
        
    }



}
