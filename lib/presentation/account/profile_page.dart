import 'package:fic9_ecommerce_app/common/components/menu_tile.dart';
import 'package:fic9_ecommerce_app/common/constants/images.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 32.0),
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: Image.network(
                'https://www.greenscene.co.id/wp-content/uploads/2022/03/Luffy-9.jpg',
                width: 60.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            title: const Text('Dito'),
            subtitle: const Text('Alamat Email'),
          ),
          MenuTile(
            title: 'Email',
            value: 'Alamat Email',
            iconPath: Images.iconMessage,
            onTap: () {},
          ),
          MenuTile(
            title: 'No Handphone',
            value: 'Nomor Handphone',
            iconPath: Images.iconPhone,
            onTap: () {},
          ),
          MenuTile(
            title: 'Ubah Password',
            value: 'Alamat Email',
            iconPath: Images.iconPassword,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
