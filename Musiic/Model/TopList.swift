//
//  TopList.swift
//  Musiic
//
//  Created by 张小强 on 2019/10/11.
//  Copyright © 2019 张小强. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topList = try? newJSONDecoder().decode(TopList.self, from: jsonData)

import UIKit
import Foundation

func JSONModel<T>(_ type: T.Type, withKeyValues data:[String:Any]) throws -> T where T: Decodable {
    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
    do {
        let model = try JSONDecoder().decode(type, from: jsonData)
        return model
    } catch let error {
        print("error >>> \(error)")
        return try JSONDecoder().decode(type, from: Data())
    }
}

// MARK: - TopList
class TopList: Codable {
    let subscribers: [JSONAny]?
    let subscribed, creator, artists: JSONNull?
    let tracks: [Track]?
    let updateFrequency: String?
    let backgroundCoverID: Int?
    let backgroundCoverURL: JSONNull?
    let titleImage: Int?
    let titleImageURL, englishTitle: JSONNull?
    let trackNumberUpdateTime, subscribedCount, cloudTrackCount: Int?
    let tags: [JSONAny]?
    let createTime, userID: Int?
    let highQuality: Bool?
    let updateTime: Int?
    let coverImgID: Double?
    let newImported, anonimous: Bool?
    let specialType: Int?
    let coverImgURL: String?
    let totalDuration, trackCount: Int?
    let commentThreadID: String?
    let privacy, trackUpdateTime, playCount, adType: Int?
    let ordered: Bool?
    let topListDescription: String?
    let status: Int?
    let name: String?
    let id: Int?
    let coverImgIDStr, toplistType: String?

    enum CodingKeys: String, CodingKey {
        case subscribers, subscribed, creator, artists, tracks, updateFrequency
        case backgroundCoverID = "backgroundCoverId"
        case backgroundCoverURL = "backgroundCoverUrl"
        case titleImage
        case titleImageURL = "titleImageUrl"
        case englishTitle, trackNumberUpdateTime, subscribedCount, cloudTrackCount, tags, createTime
        case userID = "userId"
        case highQuality, updateTime
        case coverImgID = "coverImgId"
        case newImported, anonimous, specialType
        case coverImgURL = "coverImgUrl"
        case totalDuration, trackCount
        case commentThreadID = "commentThreadId"
        case privacy, trackUpdateTime, playCount, adType, ordered
        case topListDescription = "description"
        case status, name, id
        case coverImgIDStr = "coverImgId_str"
        case toplistType = "ToplistType"
    }

    init(subscribers: [JSONAny], subscribed: JSONNull?, creator: JSONNull?, artists: JSONNull?, tracks: [Track], updateFrequency: String, backgroundCoverID: Int, backgroundCoverURL: JSONNull?, titleImage: Int, titleImageURL: JSONNull?, englishTitle: JSONNull?, trackNumberUpdateTime: Int, subscribedCount: Int, cloudTrackCount: Int, tags: [JSONAny], createTime: Int, userID: Int, highQuality: Bool, updateTime: Int, coverImgID: Double, newImported: Bool, anonimous: Bool, specialType: Int, coverImgURL: String, totalDuration: Int, trackCount: Int, commentThreadID: String, privacy: Int, trackUpdateTime: Int, playCount: Int, adType: Int, ordered: Bool, topListDescription: String, status: Int, name: String, id: Int, coverImgIDStr: String, toplistType: String) {
        self.subscribers = subscribers
        self.subscribed = subscribed
        self.creator = creator
        self.artists = artists
        self.tracks = tracks
        self.updateFrequency = updateFrequency
        self.backgroundCoverID = backgroundCoverID
        self.backgroundCoverURL = backgroundCoverURL
        self.titleImage = titleImage
        self.titleImageURL = titleImageURL
        self.englishTitle = englishTitle
        self.trackNumberUpdateTime = trackNumberUpdateTime
        self.subscribedCount = subscribedCount
        self.cloudTrackCount = cloudTrackCount
        self.tags = tags
        self.createTime = createTime
        self.userID = userID
        self.highQuality = highQuality
        self.updateTime = updateTime
        self.coverImgID = coverImgID
        self.newImported = newImported
        self.anonimous = anonimous
        self.specialType = specialType
        self.coverImgURL = coverImgURL
        self.totalDuration = totalDuration
        self.trackCount = trackCount
        self.commentThreadID = commentThreadID
        self.privacy = privacy
        self.trackUpdateTime = trackUpdateTime
        self.playCount = playCount
        self.adType = adType
        self.ordered = ordered
        self.topListDescription = topListDescription
        self.status = status
        self.name = name
        self.id = id
        self.coverImgIDStr = coverImgIDStr
        self.toplistType = toplistType
    }
    public func JSONModel<T>(_ type: T.Type, withKeyValues data:[String:Any]) throws -> T where T: Decodable {
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
        let model = try JSONDecoder().decode(type, from: jsonData)
        return model
    }
}

// MARK: - Track
class Track: Codable {
    let first, second: String

    init(first: String, second: String) {
        self.first = first
        self.second = second
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
