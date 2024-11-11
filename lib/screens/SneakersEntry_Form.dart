import 'package:flutter/material.dart';
import 'package:sneakers_store/widgets/left_drawer.dart';

class SneakersentryForm extends StatefulWidget {
  const SneakersentryForm({super.key});

  @override
  State<SneakersentryForm> createState() => _SneakersEntryFormPageState();
}

class _SneakersEntryFormPageState extends State<SneakersentryForm> {
  final _formKey = GlobalKey<FormState>();
  String _sneakers = "";
  String _description = "";
  int _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah sneaker Kamu Hari ini',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(), // Tambahkan drawer LeftDrawer di sini
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "sneaker",
                    labelText: "sneaker",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _sneakers = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "sneaker tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "description",
                    labelText: "description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "description tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "jumlah",
                    labelText: "jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty .all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('sneaker berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('sneaker: $_sneakers'),
                  Text('description: $_description'),
                  Text('jumlah: $_amount'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  _formKey.currentState!.reset();
                },
              ),
            ],
          );
        },
      );
    }
  },
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
