import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar(BuildContext context, {allowBack = false}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: allowBack
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : const Text(''),
      title: const Text(
        "eAgriMarket",
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}
