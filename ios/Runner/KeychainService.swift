//
//  KeychainService.swift
//  Runner
//
//  Created by Vinoth Vino on 17/08/23.
//

import Foundation

struct SecureStorageResponse {
    var status: OSStatus?
    var value: Any?
}

class KeychainService {
    private func baseQuery(key: String?, groupId: String?, accountName: String?, synchronizable: Bool?, returnData: Bool?) -> Dictionary<CFString, Any> {
        var keychainQuery: [CFString: Any] = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked,
        ]
        if (key != nil) {
            keychainQuery[kSecAttrAccount] = key
        }
        
        if (groupId != nil) {
            keychainQuery[kSecAttrAccessGroup] = groupId
        }
        
        if (accountName != nil) {
            keychainQuery[kSecAttrService] = accountName
        }
        
        if (synchronizable != nil) {
            keychainQuery[kSecAttrSynchronizable] = synchronizable
        }
        
        if (returnData != nil) {
            keychainQuery[kSecReturnData] = returnData
        }
        return keychainQuery
    }
    
    func containsKey(key: String, groupId: String?, accountName: String?, synchronizable: Bool?) -> Bool {
        if read(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable).value != nil {
            return true
        } else {
            return false
        }
    }
    
    func read(key: String, groupId: String?, accountName: String?, synchronizable: Bool?) -> SecureStorageResponse {
        let keychainQuery = baseQuery(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: true)
        
        var ref: AnyObject?
        let status = SecItemCopyMatching(
            keychainQuery as CFDictionary,
            &ref
        )
        
        var value: String? = nil
        
        if (status == noErr) {
            value = String(data: ref as! Data, encoding: .utf8)
        }
        return SecureStorageResponse(status: status, value: value)
    }
    
    func deleteAll(groupId: String?, accountName: String?, synchronizable: Bool?) -> OSStatus {
        let keychainQuery = baseQuery(key: nil, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: nil)
        
        return SecItemDelete(keychainQuery as CFDictionary)
    }
    
    func delete(key: String, groupId: String?, accountName: String?, synchronizable: Bool?) -> OSStatus {
        let keychainQuery = baseQuery(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: true)
        
        return SecItemDelete(keychainQuery as CFDictionary)
    }
    
    func write(key: String, value: String, groupId: String?, accountName: String?, synchronizable: Bool?, accessibility: String?) -> OSStatus {
        var attrAccessible: CFString = kSecAttrAccessibleWhenUnlocked
        if (accessibility != nil) {
            switch accessibility {
            case "passcode":
                attrAccessible = kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
                break;
            case "unlocked":
                attrAccessible = kSecAttrAccessibleWhenUnlocked
                break
            case "unlocked_this_device":
                attrAccessible = kSecAttrAccessibleWhenUnlockedThisDeviceOnly
                break
            case "first_unlock":
                attrAccessible = kSecAttrAccessibleAfterFirstUnlock
                break
            case "first_unlock_this_device":
                attrAccessible = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
                break
            default:
                attrAccessible = kSecAttrAccessibleWhenUnlocked
            }
        }
        
        let keyExists = containsKey(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable)
        var keychainQuery = baseQuery(key: key, groupId: groupId, accountName: accountName, synchronizable: synchronizable, returnData: nil)
        if (keyExists) {
            let update: [CFString: Any?] = [
                kSecValueData: value.data(using: String.Encoding.utf8),
                kSecAttrAccessible: attrAccessible,
                kSecAttrSynchronizable: synchronizable
            ]
            
            return SecItemUpdate(keychainQuery as CFDictionary, update as CFDictionary)
        } else {
            keychainQuery[kSecValueData] = value.data(using: String.Encoding.utf8)
            keychainQuery[kSecAttrAccessible] = attrAccessible
            
            return SecItemAdd(keychainQuery as CFDictionary, nil)
        }
    }
}



