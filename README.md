## tugas 7

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

    -stateles widget
    stateles widget adalah widget yang tidak memiliki state atau kondisi yang berubah di mana nilai-nilainya tidak bisa diupdate tanpa membuat ulang widget tersebut. contohnya seperti teks, icon, atau tombol yang tidak membutuhkan perubahan data.

    -stateful widget
    stateful widget adalah widget yang memiliki state yang berubah-ubah. contohnya tombol yang bisa berubah warna saat ditekan atau teks yang bisa berubah isinya 

    perbedaan di antara keduanya adalah stateles widget dapat berubah setelah dibuat, sedangkan stateful widget bisa berubah dan akan merender ulang.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
    -MaterialApp: Ini adalah widget utama yang digunakan untuk membangun aplikasi berbasis Material Design. MaterialApp menyediakan struktur dasar untuk mengatur navigasi, tema, dan orientasi aplikasi.
    -Scaffold: Widget ini menyediakan struktur dasar halaman seperti AppBar, Body, dan FloatingActionButton. Ini berguna untuk membuat layout standar aplikasi.
    -AppBar: Menampilkan bar di bagian atas aplikasi dengan judul atau ikon. Di sini kita menggunakan AppBar untuk menampilkan judul aplikasi.
    -Text: Digunakan untuk menampilkan teks pada layar. Dalam aplikasi ini, Text digunakan untuk menampilkan informasi pengguna dan sambutan di halaman utama.
    -Row dan Column: Widget ini digunakan untuk menyusun widget secara horizontal (Row) atau vertikal (Column). Dalam aplikasi ini, Row digunakan untuk menampilkan InfoCard secara berdampingan, dan Column untuk menyusun item secara vertikal.
    -GridView: Membuat grid dengan jumlah kolom tertentu untuk menampilkan daftar item dengan rapi. Di aplikasi ini, GridView.count digunakan untuk menampilkan menu-menu seperti "Lihat Mood" dan "Tambah Mood" dalam bentuk grid.
    -Card: Membuat kotak kartu dengan bayangan, cocok untuk menampilkan informasi seperti data pengguna. InfoCard dan ItemCard dalam aplikasi ini menggunakan Card untuk tampilannya.
    -Icon: Menampilkan ikon pada layar. Ikon di sini digunakan untuk menampilkan ikon di setiap menu (Lihat Mood, Tambah Mood, Logout).
    -SnackBar: Menampilkan pesan sementara di bagian bawah layar ketika suatu tindakan dilakukan, seperti saat salah satu ItemCard ditekan.

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
    setState() adalah fungsi dalam stateful widget yang digunakan untuk memberitahui bahwa ada perubahan data pada aplikasi.

    variabel yang berdampak adalah variabel yang berada di dalam class state dan terkait dengan UI.

4. Jelaskan perbedaan antara const dengan final.
    -const digunakan untuk membuat nilai konstan, sehingga nilainya akan tetap dan tidak bisa diubah.

    -final digunakan untuk nilai yang diinisiasi sekali, tetapi nilainya mungkin bisa diketahui saat runtime. nilai final tidak bisa diubah tapi nilainya bisa dihitung ketika aplikasi berjalan

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
    1. Membuat Project Flutter:

    Buka terminal dan jalankan:
    bash
    Salin kode
    flutter create cookies_store
    cd cookies_store
    flutter run
    Setup Struktur Awal Project:

    2 Edit main.dart agar homepage diarahkan ke menu.dart:

    dart
    Salin kode
    import 'package:flutter/material.dart';
    import 'package:cookies_store/menu.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Cookies Store',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.brown,
            ).copyWith(secondary: Colors.brown[400]),
            useMaterial3: true,
        ),
        home: MyHomePage(),
        );
    }
    }

    3. Membuat Kelas ItemHomepage:

    Pada menu.dart, tambahkan kelas berikut untuk menyimpan nama dan ikon tombol:
    dart
    
    class ItemHomepage {
        final String name;
        final IconData icon;
        ItemHomepage(this.name, this.icon);
    }
    Menambahkan Daftar Item:

    4. Tambahkan daftar item pada menu.dart dengan tiga tombol (Lihat Daftar Produk, Tambah Produk, Logout):
    dart

    final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.store),
    ItemHomepage("Tambah Produk", Icons.add),
    ItemHomepage("Logout", Icons.logout),
    ];
    Membuat ItemCard dan Menggunakan Snackbar:

    5. Buat ItemCard sebagai StatelessWidget untuk menampilkan setiap item. Tambahkan kode berikut pada ItemCard untuk memunculkan Snackbar saat tombol ditekan:
    dart
  
    onTap: () {
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
    );
    },
    Mengupdate MyHomePage:

    Pada MyHomePage, ubah konstruktor menjadi ({super.key}) tanpa parameter title.