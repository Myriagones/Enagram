//
//  MediasRouter.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Alamofire

enum InstagramRouter: URLRequestConvertible {
  case getMedias
  case getMedia(id: String)
  case getMediaChildren(id: String)
  
  private var method: HTTPMethod {
    switch self {
    case .getMedias, .getMedia, .getMediaChildren:
      return .get
    }
  }
  
  private var path: String {
    switch self {
    case .getMedias:
      return "me/media"
    case .getMedia(let id):
      return id
    case .getMediaChildren(let id):
      return id + "/children"
    }
  }
  
  private var parameters: Parameters? {
    var temp = Parameters()
    temp["access_token"] = VendorKeysProvider.accessToken
    switch self {
    case .getMedias:
      temp["fields"] = "id,caption"
    case .getMedia, .getMediaChildren:
      temp["fields"] = "id,media_type,media_url,username,timestamp"
    }
    return temp
  }
  
  func asURLRequest() throws -> URLRequest {
    let urlString = VendorKeysProvider.baseUrl.appending(path).removingPercentEncoding ?? ""
    let url = try urlString.asURL()
    var request = URLRequest(url: url)
    request.timeoutInterval = 30
    request.httpMethod = method.rawValue
    if let parameters = parameters {
      request = try URLEncoding.default.encode(request, with: parameters)
    }
    return request
  }
}
