// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:exercise_element/main.dart';
import 'package:exercise_icons/exercise_icons.dart';
import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class WholeCatalog {
  /// Get item by [id].
  ///
  /// Extract and ListExercises from [excersiceRows] which represents all exercise assets.
  ExerciseItem getById(int id) => ExerciseItem(id);

  /// Get item by its position in the catalog.
  ExerciseItem getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}

// @immutable
// class Item {
//   final int id;
//   final String name;
//   final Color color;
//   final int price = 42;

//   Item(this.id, this.name)
//     // To make the sample app look nicer, each item is given one of the
//     // Material Design primary colors.
//     : color = Colors.primaries[id % Colors.primaries.length];

//   @override
//   int get hashCode => id;

//   @override
//   bool operator ==(Object other) => other is Item && other.id == id;
// }

// the base class for listing the exercises
// defined (eventually) as containing exercise_icon, timer widget, and buttons
abstract class ListExercises {
  // The title line
  Widget buildTitle(BuildContext context);

  // The exercise element
  Widget buildExerciseElement(BuildContext context);

  // The exercise element
  Widget buildSubtitle(BuildContext context);

}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListExercises {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }

  @override
  Widget buildExerciseElement(BuildContext context) => Text(heading);

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class ExerciseItem implements ListExercises {
  final int id;
  final int seconds = 30;
  final String name = "tmp";
  final Color color = Colors.blueGrey;

  // to reassign the name to the ExerciseText

  ExerciseItem(this.id);
  @override
  Widget buildTitle(BuildContext context) => const SizedBox.shrink();

  @override
  Widget buildExerciseElement(BuildContext context){
    Row row = Row(
      children: <Widget>[Exercise(id: id)],
    );
    String name = extractTextFromRow(row);
    return Exercise(id: id,);
  }
  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();

  // Function to extract the text from the Row
  String extractTextFromRow(Row row) {
    for (Widget child in row.children) {
      if (child is Text) {
        return child.data ?? '';
      }
    }
    return '';
  }
}