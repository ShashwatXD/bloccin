import 'package:blocbase/screens/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloccin 💥"),
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
                Navigator.pop(context); // close drawer
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
            case 1:
            case 2:
            default:
              return const Center(child: Text("Unknown section"));
          }
        },
      ),
    );
  }
}
