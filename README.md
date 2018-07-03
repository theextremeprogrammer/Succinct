# Succinct
*Write de-coupled BDD-style tests for your iOS apps.*

I started to build out this framework so I could have a de-coupled approach to testing my iOS apps using BDD-style tests. After re-creating the same style of tests several times I thought it'd be best to pull them together into a framework to help myself and possibly others. 

Succinct doesn't support every last aspect of testing an iOS app yet - as I need functionality I'm slowly adding it in. Functionality at the current time includes:

### UIViewController
UIViewController methods give a convenient way of interacting with the objects located within that view controller's hierarchy without coupling yourself to the private details that the VC contains. 

#### UIButton Commands
```
tapButton(withExactText searchText: String)
tapButton(withImage searchImage: UIImage)
```

#### UIButton Queries
```
hasButton(withExactText searchText: String) -> Bool
hasButton(withImage searchImage: UIImage) -> Bool
```

#### UIBarButtonItem Commands
```
tapLeftBarButtonItem()
```

#### UILabel Commands
```
findLabel(withExactText searchText: String) -> UILabel?
findLabel(containingText searchText: String) -> UILabel?
```

#### UILabel Queries
```
hasLabel(withExactText searchText: String) -> Bool
hasLabel(containingText searchText: String) -> Bool
```

...
