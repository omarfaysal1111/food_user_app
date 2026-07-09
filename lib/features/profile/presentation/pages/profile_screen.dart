import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:food_user_app/features/profile/presentation/bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final profile = state.profile;
          if (profile == null) {
            return const Center(child: Text('No profile data'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${profile.fullName.isNotEmpty ? profile.fullName : '${profile.firstName} ${profile.lastName}'}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Email: ${profile.email}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Phone: ${profile.phone}', style: const TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
