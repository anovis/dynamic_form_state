# Dart dynamic_form_state

![Pub Version](https://img.shields.io/pub/v/dynamic_form_state)
![Master](https://github.com/anovis/dynamic_form_state/workflows/Dart%20CI/badge.svg?branch=main)

**dynamic_form_state** makes it easy to manage a changing widget state with many different types of values, for example a large input form. Initalize dynamic_form_state with
any number of dynamic values with default values and access both its setState and values with ease.

## Install

To get this plugin, add `dynamic_form_state` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/). For example:

```yaml
dependencies:
  dynamic_form_state: ^1.0.0
```

## Usage

Initialize your dynamic_form_state in your stateful widget's initState, passing in desired default values. 

```dart
  @override
  void initState() {
    super.initState();
    formState = DynamicFormState([
      DynamicValue("value", false),
      DynamicValue("text", TextEditingController()),
      DynamicValue("custom", {"key1": "value1", "key2": "value2"})
    ])
      ..initialize(setState);
```

Pass in a stateful value and default onChange function into various components using dynamic_form_states getters. For more complex use cases you can 
use the onChange function inside of your own functions. See `CustomWidget` in the example. 

```dart
Radio(
    value: formState.get("value"),
    groupValue: formState.get("value"),
    onChanged: formState.getOnChange("value")
)

TextField(controller: formState.get("text"))

CustomWidget(formState.get("custom"), (key, value) {
  Map<String, bool> items = formState.get("custom");
  items[key] = value;
  var onChange = formState.getOnChange("custom");
  onChange(items);
})
```



## Issues

Please file any issues, bugs or feature requests as an issue on our [GitHub](https://github.com/anovis/dynamic_form_state/issues) page. 

## Want to Contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature) submit a [pull request](https://github.com/anovis/dynamic_form_state/pulls).

## Want to Support

<!-- markdownlint-disable MD033 -->
<a href="https://www.buymeacoffee.com/austennovis" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" height="41" width="174"></a>
<!-- markdownlint-disable MD033 -->
