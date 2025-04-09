import 'package:blocbase/bloc/navigation_cubit.dart';
import 'package:blocbase/screens/productscreen.dart';
import 'package:blocbase/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitles = {
      0: "🛍️ Product List",
      1: "📝 Form Screen",
      2: "🎵 Music Player",
    };

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return Text(pageTitles[state] ?? "BlocBase");
          },
        ),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: const Text("🛒 Products"),
              onTap: () {
                context.read<NavigationCubit>().navigateTo(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("📝 Form"),
              onTap: () {
                context.read<NavigationCubit>().navigateTo(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("🎵 Music"),
              onTap: () {
                context.read<NavigationCubit>().navigateTo(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          switch (state) {
            case 0:
              return const ProductScreen(showAppBar: false);
            case 1:
              return const Center(child: Text("Form Screen"));
            case 2:
              return const Center(child: Text("Music Screen"));
            default:
              return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
