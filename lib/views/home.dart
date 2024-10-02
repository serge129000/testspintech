import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_spintech/view_model/product_view_model.dart';
import 'package:test_spintech/views/widgets/bottom_navigation.dart';
import 'package:test_spintech/views/widgets/product_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ProductViewModel productViewModel;
  @override
  void initState() {
    productViewModel = context.read<ProductViewModel>();
    Future.delayed(Duration.zero, () {
      productViewModel.getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNav(),
      body: ListView(
        children: [
          ListTile(
            title: Text('Welcome Back',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                )),
            subtitle: Text(
              'GABA Serge',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            trailing: Image.asset('assets/icons/bag-2.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextFormField(),
          ),
          Consumer<ProductViewModel>(builder: (context, productViewModel, widgets) {
            if (productViewModel.status == Status.loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (productViewModel.status == Status.loaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    ...productViewModel.allProducts.map((e)=> ProductContainer(image: e.image,))
                  ],
                ),
              );
            }
            if (productViewModel.status == Status.error) {
              return TextButton(
                  onPressed: () {
                    productViewModel.getProducts();
                  },
                  child: Text("Rety"));
            }
            return SizedBox();
          })
        ],
      ),
    );
  }
}
