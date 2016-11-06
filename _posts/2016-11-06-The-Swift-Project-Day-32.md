---
layout: post
title: "The Swift Project: Day 31"
description: ""
category:
tags: [swift, iOS]
---
![Smashtag]({{ site.url }}/resources/smashtag-day32.gif)

I finished programming assignment 4 today. The twitter client is working as required in the assignment. I'm pleased with the code and how it's structured as it provides a good starting point for developing a fully fledged Twitter client.

For the `TweetDetailTableViewController` (the one that appears when you click a tweet) I implemented a solution similar to the one in the calculator app for dealing with different types of associated content (aka. the different operations in the calculator app). The different types of content were images, hashtags, urls and users. hashtags, urls and users are all text based, so I didn't construct a custom `UITableViewCell` class for them; I used the existing one. For images I made the following class:

```
@IBOutlet weak var mediaItemImageView: UIImageView!

    var mediaItem : MediaItem? {
        didSet {
            fetchMediaItem()
        }
    }

    private var lastURL : URL?

    private func fetchMediaItem() {

        if let item = mediaItem {
            lastURL = item.url

            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                do {
                    let imageData = try Data(contentsOf: item.url)

                    DispatchQueue.main.async {

                        if (item.url == self?.mediaItem?.url) {
                            self?.mediaItemImageView?.image = UIImage(data: imageData)
                            self?.mediaItemImageView.bounds = CGRect(x: 0, y: 0, width: self!.bounds.width, height: (1.0 / CGFloat(item.aspectRatio)) * self!.bounds.width)
                            self?.setNeedsLayout()
                        }
                        else {
                            // print("Ignored data from url: \(weakSelf?.lastURL)")
                        }
                    }
                }
                catch {
                    print("Image from \(self?.lastURL) could not be fetched")
                    DispatchQueue.main.async {
                        self?.imageView?.image = nil
                    }
                }
            }
        }
    }
```

It fetches the image asynchronously and sets the image view bounds so the image fills it according to the aspect ratio.

Then I defined an enum for the different cell identifiers. One for images and one for text:


```
enum CellIdentifier: String {
    case MediaItem = "Image"
    case Mention = "Mention"
}
```

This enum got stored in a struct called `Section`. This struct represents the different sections in the `TweetDetailTableViewController`: the images section, the hahstags section, the urls section and the users sections. Since a tweet might have multiple links for example, the `Section` defines an `AnyObject` array which holds all these. The identifier states which prototype cell to use. The closure is called when the user presses the cell.

```
struct Section {
    let name: String
    var content = [AnyObject]()
    let identifier : CellIdentifier
    let whenClicked : (_ indexPath: IndexPath) -> Void
}
```

From there I defined an array with the different sections. I specify in the `addAssociatedContent` function that if the content is empty, it isn't added to the sections. In that way one doesn't get four sections in the table view when there really are just two.

```
var tweet: Tweet? {
    didSet {
        sections.removeAll()

        addAssociatedContent(content: tweet!.media,
                             forName: "Images",
                             withIdentifier: CellIdentifier.MediaItem,
                             whenClicked: {[weak self] in self?.performSegue(withIdentifier: "Show Image", sender: (self?.sections[$0.section].content as! [MediaItem])[$0.row].url)})
        addAssociatedContent(content: tweet!.hashtags,
                             forName: "Hashtags",
                             withIdentifier: CellIdentifier.Mention,
                             whenClicked: {[weak self] in self?.performSegue(withIdentifier: "Show Mentions", sender: (self?.sections[$0.section].content as! [Mention])[$0.row].keyword)})
        addAssociatedContent(content: tweet!.urls,
                             forName: "Links",
                             withIdentifier: CellIdentifier.Mention,
                             whenClicked: { [weak self] in
                                let url = URL(string: (self?.sections[$0.section].content[$0.row] as! Mention).keyword)
                                UIApplication.shared.open(url!)
        })
        addAssociatedContent(content: tweet!.userMentions,
                             forName: "Users",
                             withIdentifier: CellIdentifier.Mention,
                             whenClicked: {[weak self] in self?.performSegue(withIdentifier: "Show Mentions", sender: (self?.sections[$0.section].content as! [Mention])[$0.row].keyword)})
        tableView.reloadData()
    }
}

private func addAssociatedContent(content: [AnyObject], forName name: String, withIdentifier identifier: CellIdentifier, whenClicked: @escaping (_ indexPath: IndexPath) -> Void) {
    if (!content.isEmpty) {
        sections.append(Section(name: name, content: content, identifier: identifier, whenClicked: whenClicked))
    }
}
```

This makes the table view data source and delegate quite simple:

```
override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].content.count
}

override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section].name
}

override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    sections[indexPath.section].whenClicked(indexPath)
}

override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    if (sections[indexPath.section].identifier == .MediaItem) {
        let mediaItem = (sections[indexPath.section].content[indexPath.row] as! MediaItem)
        return CGFloat(1.0 / mediaItem.aspectRatio) * tableView.bounds.width
    }
    else {
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: sections[indexPath.section].identifier.rawValue, for: indexPath)

    switch sections[indexPath.section].identifier {
    case .MediaItem:

        if let mediaItemCell = cell as? MediaItemTableViewCell {
            mediaItemCell.mediaItem = (sections[indexPath.section].content[indexPath.row] as? MediaItem)

            return mediaItemCell
        }

    default:
        cell.textLabel!.text = (sections[indexPath.section].content[indexPath.row] as? Mention)?.keyword
    }

    return cell
}
```

I found this assignment was easier than the last one. Nevertheless am I quite pleased with it; I managed to write a flexible data structure and kept the code clean and simple.

The updated code is <a href="https://github.com/simengangstad/The-Swift-Project" target="_blank">here</a>
