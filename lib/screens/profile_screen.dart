import 'package:flutter/material.dart';
import 'registration_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // 2 * 8px
        child: Column(
          children: [
            // Profile header
            Container(
              padding: const EdgeInsets.all(16), // 2 * 8px
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16), // 2 * 8px
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8, // 8px spacing
                    offset: const Offset(0, 2), // 0.25 * 8px
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40, // 5 * 8px
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.person,
                      size: 40, // 5 * 8px
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16), // 2 * 8px
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 20, // 2.5 * 8px
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4), // 0.5 * 8px
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            fontSize: 16, // 2 * 8px
                            color: Theme.of(context).brightness == Brightness.dark 
                                ? Colors.grey[400] 
                                : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8), // 8px spacing
                        SizedBox(
                          height: 30, // ~3.75 * 8px
                          child: OutlinedButton(
                            onPressed: () {
                              // Handle edit profile
                            },
                            child: const Text('Edit Profile'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), // 2 * 8px
            // Profile options
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16), // 2 * 8px
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8, // 8px spacing
                    offset: const Offset(0, 2), // 0.25 * 8px
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildProfileOption(
                    context,
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    onTap: () {
                      // Handle my orders
                    },
                  ),
                  const Divider(height: 0),
                  _buildProfileOption(
                    context,
                    icon: Icons.favorite,
                    title: 'Wishlist',
                    onTap: () {
                      // Handle wishlist
                    },
                  ),
                  const Divider(height: 0),
                  _buildProfileOption(
                    context,
                    icon: Icons.location_on,
                    title: 'Addresses',
                    onTap: () {
                      // Handle addresses
                    },
                  ),
                  const Divider(height: 0),
                  _buildProfileOption(
                    context,
                    icon: Icons.payment,
                    title: 'Payment Methods',
                    onTap: () {
                      // Handle payment methods
                    },
                  ),
                  const Divider(height: 0),
                  _buildProfileOption(
                    context,
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {
                      // Handle help & support
                    },
                  ),
                  const Divider(height: 0),
                  _buildProfileOption(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      // Handle logout
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16), // 2 * 8px
      onTap: onTap,
    );
  }
}