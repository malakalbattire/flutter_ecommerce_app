import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/provider/cart_provider.dart';
import 'package:flutter_ecommerce_app/provider/favorites_provider.dart';
import 'package:flutter_ecommerce_app/views/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/views/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/views/pages/home_page.dart';
import 'package:flutter_ecommerce_app/views/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 12.0),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                'https://i.pinimg.com/564x/05/0f/d2/050fd2766e583ea6b578ea5b86f01272.jpg'),
            radius: 25,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Malak',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'Let\'s go shopping!',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: Colors.grey,
            ),
          ),
          PersistentTabConfig(
            screen: ChangeNotifierProvider(
              create: (_) => CartProvider(),
              child: CartPage(),
            ),
            item: ItemConfig(
              icon: const Icon(Icons.shopping_cart),
              title: "Cart",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: Colors.grey,
            ),
          ),
          PersistentTabConfig(
            screen: ChangeNotifierProvider(
              create: (_) => FavoritesProvider(),
              child: FavoritesPage(),
            ),
            item: ItemConfig(
              icon: const Icon(Icons.favorite_border),
              title: "Favorite",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: Colors.grey,
            ),
          ),
          PersistentTabConfig(
            screen: ProfilePage(),
            item: ItemConfig(
              icon: const Icon(Icons.person),
              title: "Profile",
              activeForegroundColor: Theme.of(context).primaryColor,
              inactiveForegroundColor: Colors.grey,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style6BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
