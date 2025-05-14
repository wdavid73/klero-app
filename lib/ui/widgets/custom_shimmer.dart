import 'package:flutter/material.dart';
import 'package:klero_app/config/theme/responsive.dart';
import 'package:shimmer/shimmer.dart';

/// A widget that displays a shimmering list of placeholder items.
/// It is typically used to indicate that data is loading.
class ShimmerList extends StatelessWidget {
  /// The number of placeholder items to display in the list.
  final int itemCount;

  /// Creates a [ShimmerList] widget.
  ///
  /// The [itemCount] defaults to 6 if not provided.
  const ShimmerList({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      physics:
          const NeverScrollableScrollPhysics(), // To disable scrolling during loading
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300] ??
              Colors.grey, // Base color of the shimmer effect
          highlightColor: Colors.grey[100] ??
              Colors.blueGrey, // Highlight color of the shimmer effect
          child: Container(
            width: context.width, // Makes the container take the full width
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300], // Background color of the placeholder
              borderRadius: BorderRadius.circular(
                  20), // Rounded corners for the placeholder
            ),
          ),
        ),
      ),
    );
  }
}

/// A widget that displays a shimmering grid of placeholder items.
/// It is typically used to indicate that data in a grid format is loading.
class ShimmerGrid extends StatelessWidget {
  /// The number of placeholder items to display in the grid.
  final int itemCount;

  /// The number of columns in the grid.
  final int crossAxisCount;

  /// Creates a [ShimmerGrid] widget.
  ///
  /// The [itemCount] defaults to 6, and [crossAxisCount] defaults to 2 if not provided.
  const ShimmerGrid({super.key, this.itemCount = 6, this.crossAxisCount = 2});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // To disable scrolling during loading
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.0, // Creates square-shaped grid items
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor:
            Colors.grey[300] ?? Colors.grey, // Base color of the shimmer effect
        highlightColor: Colors.grey[100] ??
            Colors.blueGrey, // Highlight color of the shimmer effect
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300], // Background color of the placeholder
            borderRadius: BorderRadius.circular(
                20), // Rounded corners for the placeholder
          ),
        ),
      ),
    );
  }
}

/// A widget that displays a horizontal shimmering list of placeholder items,
/// which can be either circles or rounded rectangles.
/// It is typically used to indicate that horizontally arranged data is loading.
class ShimmerHorizontalList extends StatelessWidget {
  /// The number of placeholder items to display in the horizontal list.
  final int itemCount;

  /// Determines if the placeholder items should be circles or rounded rectangles.
  /// Defaults to false (rounded rectangles).
  final bool isCircle;

  /// Creates a [ShimmerHorizontalList] widget.
  ///
  /// The [itemCount] defaults to 6, and [isCircle] defaults to false if not provided.
  const ShimmerHorizontalList({
    super.key,
    this.itemCount = 6,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Fixed height for the horizontal list
      child: ListView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // To disable scrolling during loading
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300] ??
                Colors.grey, // Base color of the shimmer effect
            highlightColor: Colors.grey[100] ??
                Colors.blueGrey, // Highlight color of the shimmer effect
            child: Container(
              width: isCircle ? 80.0 : 120.0, // Width of the placeholder item
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Background color of the placeholder
                shape: isCircle
                    ? BoxShape.circle
                    : BoxShape.rectangle, // Shape of the placeholder
                borderRadius: isCircle
                    ? null
                    : BorderRadius.circular(
                        8), // Rounded corners if not a circle
              ),
            ),
          ),
        ),
      ),
    );
  }
}
