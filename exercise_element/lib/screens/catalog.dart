// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:exercise_element/view_models/cart.dart';
import 'package:exercise_element/view_models/catalog.dart';
// import 'package:exercise_icons/exercise_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/exercise.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MyListItem(index),
              childCount: 4, // number of assets to display!!!!!!
            ),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Exercise item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed:
          isInCart
              ? null
              : () {
                // If the item is not in cart, we let the user add it.
                // We are using context.read() here because the callback
                // is executed whenever the user taps the button. In other
                // words, it is executed outside the build method.
                var cart = context.read<CartModel>();
                cart.add(item);
              },
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child:
          isInCart
              ? const Icon(Icons.check, semanticLabel: 'ADDED')
              : const Text('ADD'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.displayLarge),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => context.go('/catalog/cart'),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Consumer<WholeCatalog>(
      builder: (context, catalog, child) {
        if (index < 0 || index >= catalog.length) {
          return ListTile(
            title: Text('Invalid item'),
            trailing: Icon(Icons.error),
          );
        }

        var item = catalog.getByPosition(index);
        var textTheme = Theme.of(context).textTheme.titleLarge;

        return ListTile(
          title: Text(item.name, style: textTheme),
          trailing: _AddButton(item: item),
        );
      },
    );
  }
}