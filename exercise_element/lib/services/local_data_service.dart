// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Structure derived from the Flutter Compass app

import 'dart:convert';

import 'package:flutter/services.dart';

import '../config/assets.dart';

class LocalDataService {
  Future<List<String>> getNames() async {
    final List<Map<String, dynamic>> jsonList = await _loadStringAsset(Assets.names_en); // Assuming _loadStringAsset returns a List<Map<String, dynamic>>
    return jsonList.map<String>((item) => item['name'] as String).toList(); // Map each item to a string and convert to a list
  }

  Future<List<String>> getText() async {
    final List<Map<String, dynamic>> jsonList = await _loadStringAsset(Assets.text_en); // Assuming _loadStringAsset returns a List<Map<String, dynamic>>
    return jsonList.map<String>((item) => item['text'] as String).toList(); // Map each item to a string and convert to a list
  }

  /// TODO: change this to return an image
  Future<List<String>> getIcons() async {
    final List<Map<String, dynamic>> jsonList = await _loadStringAsset(Assets.icons); // Assuming _loadStringAsset returns a List<Map<String, dynamic>>
    return jsonList.map<String>((item) => item['icon'] as String).toList(); // Map each item to a string and convert to a list
  }

  /// methods to return an asset by ref 
  Future<List<String>> getNameByRef(int ref) async {
    final List<Map<String, dynamic>> jsonList = await _loadStringAsset(Assets.names_en); // Assuming _loadStringAsset returns a List<Map<String, dynamic>>
    final jsonItem = jsonList.where((name) => name["ref"] == ref);
    return jsonItem.map<String>((item) => item['name'] as String).toList(); // Map each item to a string and convert to a list
  }

  Future<List<String>> getTextByRef(int ref) async {
    final List<Map<String, dynamic>> jsonList = await _loadStringAsset(Assets.text_en); // Assuming _loadStringAsset returns a List<Map<String, dynamic>>
    final jsonItem = jsonList.where((text) => text["ref"] == ref);
    return jsonItem.map<String>((item) => item['text'] as String).toList(); // Map each item to a string and convert to a list
  }

  /// TODO: change this to return an image
  Future<List<String>> getIconByRef(int ref) async {
    final List<Map<String, dynamic>> jsonList = await _loadStringAsset(Assets.icons); // Assuming _loadStringAsset returns a List<Map<String, dynamic>>
    final jsonItem = jsonList.where((icon) => icon["ref"] == ref);
    return jsonItem.map<String>((item) => item['icon'] as String).toList(); // Map each item to a string and convert to a list
  }

  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);
    return (jsonDecode(localData) as List).cast<Map<String, dynamic>>();
  }

}