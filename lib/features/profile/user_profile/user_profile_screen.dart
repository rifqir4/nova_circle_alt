import 'package:flutter/material.dart';
import 'package:nova_circle_alt/features/profile/user_profile/widgets/user_profile_header.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: UserProfileHeader()),
        ],
      ),
    );
  }
}
