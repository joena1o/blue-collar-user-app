import 'package:blue_collar_app/features/user_app_features/home_screen/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) {
            return const ItemCard();
          }),
        ),
      ),
    );
  }
}
