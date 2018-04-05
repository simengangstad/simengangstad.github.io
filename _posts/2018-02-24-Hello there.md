---
layout: post
title: "Hello there"
description: ""
category:
tags: []
---
{% include JB/setup %}

Long time no see… I’m terrible at updating this blog :P

I’ve been doing some work in Swift and Cocoa Touch lately. Mainly I’ve been focusing on making a personal journal app, as neither of the big ones on the App Store makes it possible to write an entry and set the date for it (e.g. if you want to write about something that happened a week ago and set the entry to that date). That was a big deal for the app I needed, as I wanted to digitalise a bunch of paper-written posts from the autumn and the winter, and the date and time for those posts were a necessity. Therefore I made an app for that. It borrows a lot of UI aspects from Path, which I’m extremely fond of, but I didn’t end up using because of the problem discussed above. It turned out like this: 

![Today]({{ site.url }}/resources/today.png)

I don’t think I’ll release this on the App Store though, as it’s just something I made for myself.

The app’s model is based on cloud kit records and it uses a library I’ve been working on called [SwiftyCloudKit](https://github.com/simengangstad/SwiftyCloudKit). The library makes it quite easy to deal with fetching, uploading, deletion and changing records in the iCloud database. It’s also flexible and can handle subscriptions.
