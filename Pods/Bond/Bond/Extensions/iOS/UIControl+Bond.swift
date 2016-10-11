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

import UIKit

@objc class UIControlBondHelper: NSObject
{
  weak var control: UIControl?
  let sink: (UIControlEvents) -> ()
  
  init(control: UIControl, sink: @escaping (UIControlEvents) -> ()) {
    self.control = control
    self.sink = sink
    super.init()
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchDown), forControlEvents: UIControlEvents.touchDown)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchDownRepeat), forControlEvents: UIControlEvents.touchDownRepeat)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchDragInside), forControlEvents: UIControlEvents.touchDragInside)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchDragOutside), forControlEvents: UIControlEvents.touchDragOutside)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchDragEnter), forControlEvents: UIControlEvents.touchDragEnter)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchDragExit), forControlEvents: UIControlEvents.touchDragExit)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchUpInside), forControlEvents: UIControlEvents.touchUpInside)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchUpOutside), forControlEvents: UIControlEvents.touchUpOutside)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerTouchCancel), forControlEvents: UIControlEvents.touchCancel)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerValueChanged), forControlEvents: UIControlEvents.valueChanged)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerEditingDidBegin), forControlEvents: UIControlEvents.editingDidBegin)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerEditingChanged), forControlEvents: UIControlEvents.editingChanged)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerEditingDidEnd), forControlEvents: UIControlEvents.editingDidEnd)
    control.addTarget(self, action: #selector(UIControlBondHelper.eventHandlerEditingDidEndOnExit), forControlEvents: UIControlEvents.editingDidEndOnExit)
  }
  
  func eventHandlerTouchDown() {
    sink(.touchDown)
  }
  
  func eventHandlerTouchDownRepeat() {
    sink(.touchDownRepeat)
  }
  
  func eventHandlerTouchDragInside() {
    sink(.touchDragInside)
  }
  
  func eventHandlerTouchDragOutside() {
    sink(.touchDragOutside)
  }
  
  func eventHandlerTouchDragEnter() {
    sink(.touchDragEnter)
  }
  
  func eventHandlerTouchDragExit() {
    sink(.touchDragExit)
  }
  
  func eventHandlerTouchUpInside() {
    sink(.touchUpInside)
  }
  
  func eventHandlerTouchUpOutside() {
    sink(.touchUpOutside)
  }
  
  func eventHandlerTouchCancel() {
    sink(.touchCancel)
  }
  
  func eventHandlerValueChanged() {
    sink(.valueChanged)
  }
  
  func eventHandlerEditingDidBegin() {
    sink(.editingDidBegin)
  }
  
  func eventHandlerEditingChanged() {
    sink(.editingChanged)
  }
  
  func eventHandlerEditingDidEnd() {
    sink(.editingDidEnd)
  }
  
  func eventHandlerEditingDidEndOnExit() {
    sink(.editingDidEndOnExit)
  }
  
  deinit {
    control?.removeTarget(self, action: nil, forControlEvents: UIControlEvents.allEvents)
  }
}

extension UIControl {
  
  fileprivate struct AssociatedKeys {
    static var ControlEventKey = "bnd_ControlEventKey"
    static var ControlBondHelperKey = "bnd_ControlBondHelperKey"
  }
  
  public var bnd_controlEvent: EventProducer<UIControlEvents> {
    if let bnd_controlEvent: AnyObject = objc_getAssociatedObject(self, &AssociatedKeys.ControlEventKey) as AnyObject? {
      return bnd_controlEvent as! EventProducer<UIControlEvents>
    } else {
      var capturedSink: ((UIControlEvents) -> ())! = nil
      
      let bnd_controlEvent = EventProducer<UIControlEvents> { sink in
        capturedSink = sink
        return nil
      }
      
      let controlHelper = UIControlBondHelper(control: self, sink: capturedSink)
      
      objc_setAssociatedObject(self, &AssociatedKeys.ControlBondHelperKey, controlHelper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      objc_setAssociatedObject(self, &AssociatedKeys.ControlEventKey, bnd_controlEvent, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return bnd_controlEvent
    }
  }
  
  public var bnd_enabled: Observable<Bool> {
    return bnd_associatedObservableForValueForKey("enabled")
  }
}
