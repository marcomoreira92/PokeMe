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
                        XCTAssert(model.stats?.count != 0)
                        XCTAssert(model.stats?[0].base_stat != nil)
                        XCTAssert(model.stats?[0].stat != nil)
                        XCTAssert(model.stats?[0].stat?.name != nil)
                        XCTAssert(model.sprites != nil)
                        XCTAssert(model.sprites?.other != nil)
                        XCTAssert(model.sprites?.other?.officialartwork != nil)
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
    
    func test_cdl_pokemon_by_id_from_cache() throws {

        let expectation = XCTestExpectation(description: "calls CDL layer for specific pokemon")

        pokemonCDL.getPokemonByID(pokemonID: "1", subscriber: ("CDLtest", { ( response: CDLResponse? ) -> Void in

            let pokemonFromCache = CommonDataLayer.shared.returnFromCache(cacheID: "1")
            XCTAssert(pokemonFromCache != nil)
            
            if let model = pokemonFromCache as? CDLPokemonModel {
                XCTAssert(model.name == "bulbasaur")
                XCTAssert(model.stats?.count != 0)
                XCTAssert(model.stats?[0].base_stat != nil)
                XCTAssert(model.stats?[0].stat != nil)
                XCTAssert(model.stats?[0].stat?.name != nil)
                XCTAssert(model.sprites != nil)
                XCTAssert(model.sprites?.other != nil)
                XCTAssert(model.sprites?.other?.officialartwork != nil)
            }else{
                XCTAssert(false, "model is not compatible with CDL pokemon")
            }
        
            expectation.fulfill()
        }))
        wait(for: [expectation], timeout: 1)
    }
    
    func test_home_interactor_get_pokemon_by_valid_id() throws {
        let expectation = XCTestExpectation(description: "calls home interactor layer for specific pokemon")
        let homeInteractor = HomeInteractor()
        homeInteractor.getPokemonByID(id: "1", completion: {( _ homeModelEntity : HomeInteractorModel?, _ error: HomeInteractorErrorModel?) -> Void in
            XCTAssert(error == nil)
            XCTAssert(homeModelEntity != nil)
            XCTAssert(homeModelEntity?.pokemon != nil, "has no pokemon")
            XCTAssert(homeModelEntity?.pokemon?.name != nil , "no name was passed")
            XCTAssert(homeModelEntity?.pokemon?.id != nil , "no id was passed")
            XCTAssert(homeModelEntity?.pokemon?.height != nil , "no height was passed")
            XCTAssert(homeModelEntity?.pokemon?.imageURL != nil , "no image was passed")
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 1)

    }

    
    func test_home_interactor_get_pokemon_by_invalid_id() throws {
        let expectation = XCTestExpectation(description: "calls home interactor layer for specific pokemon")
        let homeInteractor = HomeInteractor()
        homeInteractor.getPokemonByID(id: "-1", completion: {( _homeModelEntity : HomeInteractorModel?, _ error: HomeInteractorErrorModel?) -> Void in
            XCTAssert(error != nil)
            XCTAssert(error == HomeInteractorErrorModel.internalError)
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 1)
    }
    
}
