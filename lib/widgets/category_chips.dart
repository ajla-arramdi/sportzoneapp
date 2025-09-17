import 'package:flutter/material.dart';

class CategoryChips extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<String>? onSelected;

  const CategoryChips({super.key, required this.categories, this.onSelected});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  String _selected = '';

  @override
  void initState() {
    super.initState();
    if (widget.categories.isNotEmpty) {
      _selected = widget.categories.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          final label = widget.categories[index];
          final bool isSelected = label == _selected;
          return ChoiceChip(
            label: Text(label),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                _selected = label;
              });
              widget.onSelected?.call(label);
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: widget.categories.length,
      ),
    );
  }
}
