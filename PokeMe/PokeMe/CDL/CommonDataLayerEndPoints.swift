import Foundation


/**
 CommonDataLayerEndpointBuilderEnum is a enum that stores and helps to build all endpoint used in the CommonDataLayer.

 */
enum CommonDataLayerEndpointBuilderEnum{
    
    //Add all endpoints here
    case getPokemonByID(ID : String)
    
    
    /**
     This property returns the String of the endpoint with all the arguments
     - Returns: String
     */
    var endpoint : String{
        switch self {
        case .getPokemonByID(let ID):
            return "https://pokeapi.co/api/v2/pokemon/\(ID)"
        default:
            return ""
        }
    }
}

