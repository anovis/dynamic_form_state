typedef SetState = void Function(void Function());

/// Input type for  DynamicFormState
class DynamicValue<T> {
  String key;
  T value;

  DynamicValue(this.key, this.value);
}

// Class used internally in DynamicFormState
class DynamicValueItem<T> {
  String key;
  T value;
  SetState setState;

  DynamicValueItem(this.key, this.value, this.setState);

  /// onChange function that sets value to newValue
  void onChange(T newValue) {
    setState(() {
      value = newValue;
    });
  }
}

/// DynamicFormState makes it easier to manage the state of multiple value types in a statefull widget.
/// The input is a list of values where each value is a list containing a key string and an initial value
///  Requires initalize to be called during init.
class DynamicFormState {
  List<DynamicValue> values;
  Map<String, DynamicValueItem> dynamicValues = {};

  DynamicFormState(this.values);

  ///Initalize DynamicFormState by passing in setState.
  void initialize(SetState setState) {
    dynamicValues = Map.fromIterable(values,
        key: (v) => v.key,
        value: (v) => DynamicValueItem(v.key, v.value, setState));
  }

  /// Get the value for a given key
  get(String key) {
    return dynamicValues[key]?.value;
  }

  /// Get the onChange function for a given key
  getOnChange(String key) {
    return dynamicValues[key]?.onChange;
  }

  /// Set all values to a newValue. Usefull if all items are the same type. For example, if all objects are of type bool.
  setAll(newValue) {
    dynamicValues.forEach((key, value) {
      value.onChange(newValue);
    });
  }

  // Create non-initialized DynamicFormState from another DynamicFormState
  factory DynamicFormState.from(DynamicFormState other) {
    return DynamicFormState(other.values);
  }
}
