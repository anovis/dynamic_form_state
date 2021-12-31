import 'package:flutter/material.dart';
import 'package:dynamic_form_state/dynamic_form_state.dart';

class ExampleDynamicFormState extends StatefulWidget {
  const ExampleDynamicFormState({Key key}) : super(key: key);

  @override
  _ExampleDynamicFormState createState() => _ExampleDynamicFormState();
}

class _ExampleDynamicFormState extends State<ExampleDynamicFormState> {
  DynamicFormState formState = DynamicFormState([]);

  @override
  void initState() {
    super.initState();
    formState = DynamicFormState([
      DynamicValue("value", false),
      DynamicValue("text", TextEditingController()),
      DynamicValue("custom", {"key1": "value1", "key2": "value2"})
    ])
      ..initialize(setState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,
        body: ListView(children: [
          Radio(
              value: formState.get("value"),
              groupValue: formState.get("value"),
              onChanged: formState.getOnChange("value")),
          TextField(controller: formState.get("text")),
          CustomWidget(formState.get("custom"), (key, value) {
            Map<String, bool> items = formState.get("custom");
            items[key] = value;
            var onChange = formState.getOnChange("custom");
            onChange(items);
          })
        ]));
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget(
    this.items,
    this.onChanged, {
    Key key,
  }) : super(key: key);

  final Map<String, bool> items;
  final void Function(String, bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        childAspectRatio: 4,
        crossAxisCount: 2,
        children: items.keys.map((String item) {
          return Row(children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue,
              value: items[item],
              onChanged: (bool value) {
                onChanged(item, value);
              },
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Text(item, overflow: TextOverflow.visible),
            )
          ]);
        }).toList());
  }
}
