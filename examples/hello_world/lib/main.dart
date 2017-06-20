// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(
      new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(title: const Text('hello words')),
          body: new Material(
            type: MaterialType.canvas,
            child: new Container(
              child: new Center(
                child: new SuggestionWidget(
                  suggestionModel:
                      new SuggestionModel(<String>['words', 'more words']),
                ),
              ),
            ),
          ),
        ),
      ),
    );
