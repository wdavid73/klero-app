import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/data/data.dart';
import 'package:front_scaffold_flutter_v2/ui/blocs/blocs.dart';
import 'package:front_scaffold_flutter_v2/ui/widgets/widgets.dart';

class ExampleServiceScreen extends StatelessWidget {
  const ExampleServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Service"),
      ),
      body: const _ProductView(),
    );
  }
}

class _ProductView extends StatefulWidget {
  const _ProductView();

  @override
  State<_ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<_ProductView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _init();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _init() {
    context.read<ProductsBloc>().loadProducts();
  }

  void _scrollListener() {
    final scrollPosition = _scrollController.position.pixels + 400;
    final scrollMaxPosition = _scrollController.position.maxScrollExtent;
    if (scrollPosition >= scrollMaxPosition) {
      context.read<ProductsBloc>().loadProducts();
    }
  }

  void _listenerShowSnackBar(BuildContext context, ProductsState state) {
    if (state.error != '') {
      CustomSnackBar.showSnackBar(
        context,
        message: state.error,
        backgroundColor: ColorTheme.error,
        icon: Icons.error_outline_outlined,
      );
      return;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsState = context.watch<ProductsBloc>().state;

    return BlocListener<ProductsBloc, ProductsState>(
      listener: _listenerShowSnackBar,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: productsState.products.length,
          itemBuilder: (context, index) => _ProductCard(
            product: productsState.products[index],
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImageViewer(images: product.images),
        Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _ImageViewer extends StatelessWidget {
  final List<String> images;
  const _ImageViewer({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/no-image.jpg',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage(
        fit: BoxFit.cover,
        height: 250,
        fadeOutDuration: const Duration(milliseconds: 100),
        fadeInDuration: const Duration(milliseconds: 200),
        image: NetworkImage(images.first),
        placeholder: const AssetImage('assets/loaders/loading.gif'),
      ),
    );
  }
}