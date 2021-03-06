//
//  RxRetroSwift_Tests.swift
//  RxRetroSwift_Tests
//
//  Created by Michael Henry Pantaleon on 2018/01/05.
//  Copyright © 2018 iamkel.net. All rights reserved.
//

import Quick
import Nimble
import RxNimble
import RxSwift
import RxCocoa
import RxRetroSwift


@testable import RxRetroSwift_Example

class TestAPIClient:QuickSpec {
  
  override func spec() {
    
    describe("Using JSONPlaceholder API") {
      
      let apiClient = DefaultAPIClient.shared
      
      it("Can check the count & insert post"){
        
        let listObservable = apiClient.getPosts()
        expect(listObservable.map { $0.value!.count }).first == 100
        
        var post = Post()
        let title = "This is my post"
        let userId = 101
        let body = "This is a message body"
        
        post.title = title
        post.userId = userId
        post.body = body
        let insertObservable = apiClient.insertPost(post: post)
        expect(insertObservable.map { $0.value!.title }).first == title
        expect(insertObservable.map { $0.value!.userId }).first == userId
        expect(insertObservable.map { $0.value!.body }).first == body
      }
      
      
      it("Check Comments result count"){
        let observable = apiClient.getComments()
        expect(observable.map { $0.value!.count }).first == 500
      }
      
      it("Check Albums result count"){
        let observable = apiClient.getAlbums()
        expect(observable.map { $0.value!.count }).first == 100
      }
      
      it("Check Photos result count"){
        let observable = apiClient.getPhotos()
        expect(observable.map { $0.value!.count }).first == 5000
      }
      
      it("Check Todos result count"){
        let observable = apiClient.getTodos()
        expect(observable.map { $0.value!.count }).first == 200
      }
      
      it("Check Users result count"){
        let observable = apiClient.getUsers()
        expect(observable.map { $0.value!.count }).first == 10
      }
    }
  }
}
