---
layout: post
title: "The Swift Project: Day 37"
description: ""
category:
tags: [swift, iOS]
---


###### Done

Finished programming assignment 4.

##### Reflections

I chose – with Paul’s recommendation in mind – to spend a long time designing a suiting Core Data model schema for this assignment. I considered dictionary attributes assigned to the `TwitterUser`, which would keep the count of tweets for each search term. The problem with such a solution is that it wouldn’t fit for the other types of mentions; It would become complicated with hashtags for example. Therefore I decided to create entities separated from the `TwitterUser` and `TweetData`.

![schema]({{ site.url }}/resources/schema-day37.png)

SearchTerm and MentionData are instantiated like this:

```
public class SearchTerm: NSManagedObject {

    class func searchTerm(withSearchText searchText: String, inManagedObjectContext context: NSManagedObjectContext) -> SearchTerm? {

        let request: NSFetchRequest<SearchTerm> = SearchTerm.fetchRequest()
        request.predicate = NSPredicate(format: "value = %@", searchText)

        if let searchTerm = (try? context.fetch(request))?.first {
            return searchTerm
        }
        else if let searchTerm = NSEntityDescription.insertNewObject(forEntityName: "SearchTerm", into: context) as? SearchTerm {
            searchTerm.value = searchText
            return searchTerm
        }

        return nil
    }
}
```


```
public class MentionData: NSManagedObject {

    class func mentionData(withMention mention: Mention, andSearchText searchText: String, inManagedObjectContext context: NSManagedObjectContext, forNewTweet newTweet: Bool) -> MentionData? {
        let request: NSFetchRequest<MentionData> = MentionData.fetchRequest()
        request.predicate = NSPredicate(format: "value = %@ and searchTerm.value = %@", mention.keyword, searchText)

        if let mention = (try? context.fetch(request))?.first {
            if (newTweet) {
                mention.count += 1
            }
            return mention
        }
        else if let mentionData = NSEntityDescription.insertNewObject(forEntityName: "MentionData", into: context) as? MentionData {
            mentionData.count = 1
            mentionData.value = mention.keyword
            mentionData.mention = SearchTerm.searchTerm(withSearchText: searchText, inManagedObjectContext: context)
            return mentionData
        }

        return nil
    }
}
```


This schema stores mentions for each search term, where a mention can be a user, a hashtag or a link. A schema like this will of course store more data than required because all of the mentions are already in a tweet’s text. Though does it make it so easy to predicate and sort that I’m more than willing to make that sacrifice. Just look at the implementation:

```
let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MentionData")
request.predicate = NSPredicate(format: “searchTerm.value == %@ and count > 1 ", searchTerm!)
request.sortDescriptors = [NSSortDescriptor(key: "count", ascending: false), NSSortDescriptor(key: "value", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))]
```

We request all mentions which have the given search term (e.g. “stanford”) and retrieve only those which have a count bigger than 1. It sorts by count as well as sorting alphabetically.

```
let cell = tableView.dequeueReusableCell(withIdentifier: "Mention Identifier", for: indexPath)

if let mention = fetchedResultsController?.object(at: indexPath) as? MentionData {

		var value : String?
	 	var count : Int16?

    mention.managedObjectContext?.performAndWait {
    		value = mention.value
      count = mention.count
    	}

    	cell.textLabel?.text = value
    	cell.detailTextLabel?.text = "\(count!) tweets"
}
```

Then retrieving the data for the given cell is a piece of cake.

Very happy with the outcome of this assignment
