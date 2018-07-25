//
//  main.swift
//  ExURL
//
//  Created by muhlenXi on 2018/7/24.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import Foundation

let urlString1 = "https://www.fx110.com/Static/Huixin/HuixinLoadMobile.html?lgqr=22273fe9-deea-4301-b658-6998b45f6eb0&lgct=1"
let urlString2 = "http://191.168.112.5:8080"

let url1 = URL(string: urlString1)!
let url2 = URL(string: urlString2)!

// 绝对路径
print(url1.absoluteString)
// 协议
print(url1.scheme)
// 是否是文件
print(url1.isFileURL)
// 主机名
print(url1.host)
// 端口号
print(url2.port)
//
print(url1.path)
print(url1.relativePath)
// 查询参数字符串
print(url1.query)
// 路径组成部分
print(url1.pathComponents)
// 路径文件名
print(url1.lastPathComponent)

// 查询参数组成部分
let urlComponents = URLComponents(url: url1, resolvingAgainstBaseURL: true)!
print(urlComponents.queryItems)

for item in urlComponents.queryItems! {
    print(item.name)
    print(item.value)
}


extension URL {
    /// 获取 URL 的查询名称和值
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
}

