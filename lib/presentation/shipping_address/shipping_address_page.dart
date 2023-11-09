import 'package:fic9_ecommerce_app/common/components/button.dart';
import 'package:fic9_ecommerce_app/common/components/space.dart';
import 'package:fic9_ecommerce_app/presentation/shipping_address/add_address_page.dart';
import 'package:fic9_ecommerce_app/presentation/shipping_address/edit_address_page.dart';
import 'package:fic9_ecommerce_app/presentation/shipping_address/models/address_model.dart';
import 'package:fic9_ecommerce_app/presentation/shipping_address/widgets/address_tile.dart';
import 'package:flutter/material.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(1);
  final List<AddressModel> addresses = [
    AddressModel(
      name: 'Abdul Rozak',
      address: 'Jl. suka cita, no 17. Kelurahan sukses maju',
      phoneNumber: '0128781293',
    ),
    AddressModel(
      name: 'Abdul Manaf',
      address: 'Jalan lorem ipsum situ',
      phoneNumber: '098021358',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengiriman'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddAddressPage()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: addresses.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: Column(
                  children: [
                    const Text(
                      'Oppsss..\nAlamat Anda belum tersedia nih!',
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                    const SpaceHeight(20.0),
                    Button.filled(
                      onPressed: () {},
                      label: 'Tambahan Yuk',
                      width: 180.0,
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            )
          : ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, value, _) => ListView.separated(
                padding: const EdgeInsets.all(16.0),
                separatorBuilder: (context, index) => const SpaceHeight(16.0),
                itemCount: addresses.length,
                itemBuilder: (context, index) => AddressTile(
                  isSelected: value == index,
                  data: addresses[index],
                  onTap: () {
                    selectedIndex.value = index;
                  },
                  onEditTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAddressPage(
                          data: addresses[index],
                        ),
                      ),
                    );
                  },
                  onDeleteTap: () {},
                ),
              ),
            ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, value, _) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Button.filled(
            disabled: value < 0,
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'Pilih',
          ),
        ),
      ),
    );
  }
}
