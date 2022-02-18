# Message Relay Service (Mrs.)

Message Relay Service for Swift/Obj-C. This is a messaging service that utilizes protocols to subscribe/publish through a dispatch and receiver. This can be useful in apps designed around plug-in pattern, and others. 

## How is this different than NotificationCenter? 
Protocols ofcourse! Using a protocol adds a layer of decoupling (like we do for delegation), and ensures you aren't able to send a message the listener isn't expecting. 

You'll create a Dispatcher and Receiver, initialed with a specified protocol. Listeners will add to the Dispatcher, which will compiler enforce they are of the protocol type on the `addListener` method. The Receiver object acts as a proxy for the protocol type, so that any method in protocol, is available to be called on the Receiver object. Calling a method on the Receiver, triggers that same method on all of the listeners!

## How do I set this thing up?

1. Create your protocol!

```
@objc protocol PlaybackProtocol {
    func hasBecomeReady(duration: Double)
    func timeUpdated(time: Double)
    func playTriggered()
    func pauseTriggered()
}
```

2. setup your dispatcher! (and receiver)
```
    # replace `PlaybackProtocol` here with whatever protocl you are using!
    let playbackDisatch: PWKDispatcher<PlaybackProtocol> = PWKDispatcher()
    var playbackReciever: PlaybackProtocol {
        return playbackDisatch.targetReciever
    }
```

3. add a listener! (as many listeners as you want!)

```

// add protcol to class!
class TimeDisplayViewController: UIViewController, PlaybackProtocol {

// don't forget the method for protocol! (compiler won't let you forget, so don't worry bout it.)
    func hasBecomeReady(duration: Double) { ... }
    func timeUpdated(time: Double) { ... }
    func playTriggered() { ... }
    func pauseTriggered() { ... }

// listen to that dispatcher!!!
func viewDidLoad() {
    super.viewDidLoad()
    // Here we go!
    RelayCenter.playbackDisatch.addListener(self)
    ....
}
...
```

4. Fire the dispatcher, and the listener's methods get called!!! 

```
func myTimeHasChanged(newTime: Double) {
    RelayCenter.playbackReciever.timeUpdate(time:newTime)
}
```

##🎉🎉🎉Thats all you've done it! Congratulations! 🎉🎉🎉
