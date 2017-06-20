// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'divider.dart';
import 'icons.dart';
import 'input_decorator.dart';
import 'text_field.dart';

/// A model that suggests values from a list of [suggestables].
class SuggestionModel {
  final List<String> suggestables;

  SuggestionModel(this.suggestables);

  List<String> suggest(String inputText) {
    return suggestables.where((String suggestionCandidate) {
      print(
          'candidate: $suggestionCandidate contains $inputText: ${suggestionCandidate.contains(inputText)}');
      return suggestionCandidate.contains(inputText);
    }).toList();
  }
}

class SuggestionWidget extends StatefulWidget {
  final IconData leftIcon;
  final SuggestionModel suggestionModel;
  final InputDecoration decoration;

  SuggestionWidget({
    @required this.suggestionModel,
    this.leftIcon: Icons.search,
    this.decoration: const InputDecoration(),
  });

  @override
  State<SuggestionWidget> createState() => new _SuggestionWidgetState();
}

class _SuggestionWidgetState extends State<SuggestionWidget> {
  final TextEditingController _controller =
      new TextEditingController(text: 'words');

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Row(children: <Widget>[
          new Icon(widget.leftIcon),
          new Flexible(
            fit: FlexFit.tight,
            child: new TextField(
              controller: _controller,
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
        ]),
        const Divider(height: 0.0),
        new ListBody(children: _buildSuggestions(context)),
      ],
    );
  }

  List<Widget> _buildSuggestions(BuildContext context) {
    return widget.suggestionModel
        .suggest(_controller.text)
        .map((String suggestion) => new Text(suggestion))
        .take(5)
        .toList();
  }
}
