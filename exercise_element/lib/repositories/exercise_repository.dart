// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Structure derived from the Flutter Compass app


import '../models/exercise.dart';
import '../utils/result.dart';

abstract class ExerciseRepository {
  /// Returns the list of [Exercise].
  Future<Result<List<Exercise>>> getExercisesList();

  /// Returns a full [Exercise] given the id.
  Future<Result<Exercise>> getExercise(int id);

  /// Creates a new [Exercise].
  Future<Result<void>> createExercise(Exercise exercise);
}