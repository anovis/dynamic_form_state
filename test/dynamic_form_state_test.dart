import 'package:test/test.dart';
import 'package:dynamic_form_state/dynamic_form_state.dart';

void Function(void Function()) setState;
void main() {
  group('Initailize', () {
    test('Initialize DynamicFormState', () {
      DynamicFormState dfs = DynamicFormState(
          [DynamicValue('value', false), DynamicValue('text', 'text_value')]);
      dfs.initialize(setState);
      assert(dfs.dynamicValues.values.first.setState == setState);
      assert(dfs.dynamicValues.values.last.setState == setState);
      assert(dfs.dynamicValues.values.first.value == false);
      assert(dfs.dynamicValues.values.last.value == "text_value");
    });
  });
  group('Get Values', () {
    test('Get', () {
      DynamicFormState dfs = DynamicFormState(
          [DynamicValue('value', false), DynamicValue('text', 'text_value')]);
      dfs.initialize(setState);
      assert(dfs.get('value') == false);
      assert(dfs.get('text') == 'text_value');
    });
  });
}
