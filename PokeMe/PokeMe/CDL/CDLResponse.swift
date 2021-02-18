import Foundation

enum CDLResponse<T>{
    case success(T?)
    case failure(CDLErrorType)
}
