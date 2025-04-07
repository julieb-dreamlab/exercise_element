// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    /// Optional ID of the exercise.
    /// May be null if the exercise is not yet stored.
    required int id,
    // int nonNullableInt = id ?? 0; // Use 0 as the default value if nullableInt is null

    /// Exercise name
    required String name,

    /// Exercise icon
    required String icon,

    /// Description of the exercise
    required String text,

    /// Duration in seconds recommended for exercise
    required int seconds,

  }) = _Exercise;

  factory Exercise.fromJson(Map<String, Object?> json) =>
      _$ExerciseFromJson(json);
}