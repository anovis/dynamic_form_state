# Dart dynamic_form_state

![Pub Version](https://img.shields.io/pub/v/dynamic_form_state)
![Master](https://github.com/anovis/dynamic_form_state/workflows/Dart%20CI/badge.svg?branch=master)

**dynamic_form_state** makes it easy to manage a changing widget state with many different types of values, for example a large input form. Initalize dynamic_form_state with
any number of dynamic values with default values and access both its setState and values with ease.

## Install

To get this plugin, add `dynamic_form_state` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/). For example:

```yaml
dependencies:
  dynamic_form_state: ^1.0.0
```

## Usage

It is possible to add spatial based values to the tree with a geohash or directly with lat lng coordinates.

``` dart
import 'package:geohashtree/geohashtree.dart';

GeohashTree<String> tree = GeohashTree<String>(); 
tree.add("6g3mc", "iguazu"); 
tree.addLatLng(-25.686667, -54.444722, "also iguazu");
```

To get all the coordinates in a tree within a radius of `5000` meters from the point `25.6953° S, 54.4367° W`  use `getGeohashesByProximity()`. The `precision` parameter dictates how specific the geohash match should be. Precision 5 return matches of geohash of length 5, which in this case would be all geohashes that start with "6g3mc". Precision 1 return matches of geohash of length 1, which in this case would be all geohashes that start with "6".

``` dart
List<String> values = tree.getGeohashesByProximity(-25.686667, -54.444722,5000, precision: 9);
```

## Issues

Please file any issues, bugs or feature requests as an issue on our [GitHub](https://github.com/anovis/dynamic_form_state/issues) page. 

## Want to Contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature) submit a [pull request](https://github.com/anovis/dynamic_form_state/pulls).

## Want to Support

<!-- markdownlint-disable MD033 -->
<a href="https://www.buymeacoffee.com/austennovis" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" height="41" width="174"></a>
<!-- markdownlint-disable MD033 -->
