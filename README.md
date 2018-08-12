# Succinct
*Write de-coupled BDD-style tests for your iOS apps.*

I started to build out this framework so I could have a de-coupled approach to testing my iOS apps using a BDD-style approach. After re-creating the same style of tests several times I thought it'd be best to pull them together into a framework to help myself and possibly others. 

Succinct doesn't support every single aspect of testing an iOS app just yet. As functionality is needed, I'm slowly adding it in. Functionality at the current time includes:

## UIViewController
UIViewController methods give a convenient way of interacting with the objects located within that view controller's hierarchy without coupling yourself to the private details that the VC contains.  

### UIButton
Simply specify the text or image that is displayed on the button to tap it, de-coupling you from the button instance and target action. Your button instance and target action can be private in the implementation.    

#### Commands
```
tapButton(withExactText searchText: String)
tapButton(withImage searchImage: UIImage)
```

#### Queries
```
hasButton(withExactText searchText: String) -> Bool
hasButton(withImage searchImage: UIImage) -> Bool
```

### UIBarButtonItem

#### Commands
```
tapLeftBarButtonItem()
```

### UILabel

#### Commands
```
findLabel(withExactText searchText: String) -> UILabel?
findLabel(containingText searchText: String) -> UILabel?
```

#### Queries
```
hasLabel(withExactText searchText: String) -> Bool
hasLabel(containingText searchText: String) -> Bool
```

...
