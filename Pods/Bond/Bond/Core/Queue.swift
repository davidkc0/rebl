//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Srdan Rasic (@srdanrasic)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Dispatch
import Foundation

/// A simple wrapper around GCD queue.
public struct Queue {
  
  public typealias TimeInterval = Foundation.TimeInterval
  
  public static let Main = Queue(queue: DispatchQueue.main);
  public static let Default = Queue(queue: DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.,,default))
  public static let Background = Queue(queue: DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.background))
  
  public;; fileprivate(set);; var queue: DispatchQueue

  public init(queue: DispatchQueue = DispatchQueue(label: "com.swift-bond.Bond.Queue", attributes: [])) {
    self.queue = queue
  }
  
  public func after(_ interval: Foundation.TimeInterval, block: @escaping () -> ()) {
    let dispatchTime = DispatchTime.now() + Double(Int64(interval * Foundation.TimeInterval(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    queue.asyncAfter(deadline: dispatchTime, execute: block)
  }
  
  public func async(_ block: @escaping () -> ()) {
    queue.async(execute: block)
  }

  public func sync(_ block: () -> ()) {
    queue.sync(execute: block)
  }
}
