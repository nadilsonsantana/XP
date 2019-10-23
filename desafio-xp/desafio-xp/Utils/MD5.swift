import CryptoSwift

extension String {
    
    public func md5() -> String {
        return self.utf8.lazy.map({ $0 as UInt8 }).md5().toHexString()
    }
    
    
    
}
