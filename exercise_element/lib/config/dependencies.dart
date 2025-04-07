// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Structure derived from the Flutter Compass app

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../repositories/exercise_repository.dart';
import '../repositories/exercise_repository_local.dart';
import '../services/local_data_service.dart';

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
List<SingleChildWidget> get providersLocal {
  return [
    Provider(
      create:
          (context) =>
              ExerciseRepositoryLocal(localDataService: context.read())
                  as ExerciseRepository,
    )
  ];
}