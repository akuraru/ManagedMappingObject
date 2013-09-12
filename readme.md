# ManagedMappingObject

``NSManagedObject`` <-> ``NSDictionary`` (e.g JSON Model class)

Converting NSManagedObject to NSDictionary (and back again).

## Installation

```ruby
pod 'ManagedMappingObject', :git => 'https://github.com/azu/ManagedMappingObject.git'
```

## Usage

1 Setup NSManagedObject class.

You can easily generate using [mogenerator](https://github.com/rentzsch/mogenerator "mogenerator").

``` sh
mogenerator -m ManagedMappingObject.xcdatamodeld -O CoreDataModels \
    --base-class ManagedMappingObject \
    --template-var arc=true
```

* Target ``NSManagedObject`` class must be subclass of ``ManagedMappingObject``.
* Target ``NSManagedObject`` class must implement ``<ManagedMappingProtocol>`` .

2 Create ``NSValueTransformer`` subclass if transform value .

* ``UnitTransformer`` in example case.
* implement ``+ (NSDictionary *)JSONValueTransformerNames`` of ``<ManagedMappingProtocol>``.

3 You use following method in NSManagedObject, after setup.

``` objc
// NSDictionary -> NSManagedObject
+ (instancetype)insertNewWithDictionary:(NSDictionary *) dictionary managedObjectContext:(NSManagedObjectContext *) context;
// update NSManagedObject
- (void)updateWithDictionary:(NSDictionary *) dictionary;
// NSManagedObject -> NSDictionary
- (NSDictionary *)dictionaryRepresentation;
```

NOTE: These methods ignore ``nil``.

### NSDictionary Model

Raw NSDictionary is difficult to deal with,
so this example project use [JSON Accelerator](http://www.nerdery.com/json-accelerator "JSON Accelerator").

``fooJSONModel`` class has following useful methods :

```objc
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT

## Acknowledgment

Thanks @[ishkawa](https://github.com/ishkawa/ "ishkawa")

* [MantleのようなノリでJSON&gt;NSManagedObjectを楽にしたかった](http://blog.ishkawa.org/blog/2013/06/24/keymap-and-valuetransformer/ "MantleのようなノリでJSON&gt;NSManagedObjectを楽にしたかった")