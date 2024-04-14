import 'package:codemehub_project/Domain/Riverpod/ProductProvider/product_provider.dart';
import 'package:codemehub_project/Screens/Pages/login_page.dart';
import 'package:codemehub_project/Screens/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(productProvider.notifier).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          await ref.read(productProvider.notifier).fetchProducts();
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi there...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text('These products are for you'),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text('Quick Logout'),
                                  content: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  const LoginPage()),
                                          (route) => false);

                                      final Box storage = Hive.box('Storage');
                                      storage.put('isUserAuthenticated', false);
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ));
                      },
                      icon: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
              const Expanded(child: HomeView()),
            ],
          ),
        ),
      ),
    );
  }
}
