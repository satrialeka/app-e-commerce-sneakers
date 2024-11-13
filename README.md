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
    flutter create sneakers_store
    cd sneakers_store
    flutter run
    Setup Struktur Awal Project:

    2 Edit main.dart agar homepage diarahkan ke menu.dart:

    dart
    Salin kode
    import 'package:flutter/material.dart';
    import 'package:sneakers_store/menu.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Sneakers Store',
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

## tugas 8

1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

Di Flutter, kata kunci const digunakan untuk menciptakan objek atau widget yang sifatnya tetap dan tidak akan berubah selama aplikasi berjalan. Menggunakan const memungkinkan objek atau widget tersebut diinisialisasi saat kompilasi dan tidak memerlukan inisialisasi ulang selama runtime, yang sangat mengoptimalkan performa aplikasi, terutama dalam menangani widget statis.

-Manfaat Menggunakan const
    Penghematan Memori: Objek yang ditandai const hanya diinisialisasi sekali dalam memori dan dapat digunakan berulang kali. Ini mencegah alokasi objek baru setiap kali widget tersebut muncul, yang membantu menghemat memori.
    Peningkatan Kinerja: Karena objek const sudah diinisialisasi saat kompilasi, Flutter tidak perlu membuat ulang objek tersebut saat merender ulang UI, mengurangi rebuild yang tidak perlu dan mempercepat rendering.
    Konsistensi Data: const menjamin data tetap tidak berubah, menjaga data tetap konsisten karena objek const bersifat immutabel setelah inisialisasi.
    Pemanfaatan Cache Rendering: Flutter dapat menyimpan hasil rendering dari widget const untuk digunakan kembali, sehingga mengurangi beban rendering.

-Kapan Sebaiknya Menggunakan const
    Widget Statis: Pada widget atau elemen UI yang tidak berubah, misalnya Text("Hello World") atau Icon(Icons.add).
    Variabel Global: Pada data tetap yang diakses di berbagai bagian aplikasi, misalnya URL atau konstanta angka.
    Konfigurasi atau Nilai Konstanta: Untuk nilai konfigurasi seperti padding, margin, dan durasi animasi yang tidak berubah.
    List atau Map Tak Berubah: Pada list atau map yang nilainya tidak akan dimodifikasi setelah inisialisasi, seperti const [1, 2, 3].

-Kapan Sebaiknya Tidak Menggunakan const
    Data yang Bersifat Dinamis: Pada objek atau data yang akan berubah, misalnya input pengguna atau data dari server.
    Widget yang Bergantung pada State: Jika widget membutuhkan variabel yang dapat berubah melalui StatefulWidget atau penyedia data, hindari penggunaan const.
    Komponen yang Dibuat Dinamis: Misalnya widget yang dipengaruhi kondisi atau state tertentu dan memerlukan pembaruan ketika state berubah.


2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini! 
-Column: Menyusun widget dalam arah vertikal dari atas ke bawah. Biasanya digunakan untuk membuat susunan vertikal dari elemen UI, seperti teks atau tombol berurutan.

-Properti penting:
    -mainAxisAlignment: Mengatur posisi widget sepanjang sumbu vertikal.
    -crossAxisAlignment: Mengatur posisi widget di sumbu horizontal.
    -children: Menentukan widget yang akan ditampilkan di dalam Column.

Contoh:

dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("Hello, World!"),
    Text("Welcome to Flutter"),
    ElevatedButton(onPressed: () {}, child: Text("Click Me")),
  ],
)

-Row: Menyusun widget secara horizontal dari kiri ke kanan. Biasanya digunakan untuk menyusun elemen UI dalam satu baris.

-Properti penting:
    -mainAxisAlignment: Mengatur posisi widget sepanjang sumbu horizontal.
    -crossAxisAlignment: Mengatur posisi widget di sumbu vertikal.
    -children: Menentukan widget yang akan ditampilkan di dalam Row.

Contoh:
dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Icon(Icons.home),
    Text("Home"),
    ElevatedButton(onPressed: () {}, child: Text("Click Me")),
  ],
)

-Kapan Menggunakan Column atau Row
    -Column: Digunakan saat ingin menyusun elemen secara vertikal, misalnya membuat formulir atau daftar item yang ditampilkan dari atas ke bawah.
    -Row: Digunakan saat ingin menyusun elemen secara horizontal, misalnya ikon dan teks dalam satu baris atau beberapa tombol aksi yang tampil berdampingan.

-Elemen Input di Halaman Form

    Elemen yang Digunakan:
        -TextFormField untuk masukan Name (nama item).
        -TextFormField untuk masukan Amount (jumlah item), diatur agar hanya menerima angka.
        -TextFormField untuk masukan Description (deskripsi item).
        

    
-Kapan Menggunakan Column dan Row
    -Gunakan Column saat ingin membuat tata letak vertikal seperti daftar, formulir, atau sekumpulan teks dan tombol yang diletakkan dari atas ke bawah.
    -Gunakan Row saat ingin membuat tata letak horizontal, misalnya ikon dan teks pada satu baris, atau tombol-tombol tindakan yang diletakkan berdampingan.


3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Elemen Input yang Digunakan di Halaman Form:
    -TextFormField untuk memasukkan Name (nama item).
    -TextFormField untuk memasukkan Amount (jumlah item), yang diformat agar hanya menerima angka.
    -TextFormField untuk memasukkan Description (deskripsi item).
    
Elemen Input Lain di Flutter yang Tidak Digunakan:
    -DropdownButton: Elemen input ini digunakan untuk membuat dropdown list (daftar pilihan).
    -Checkbox: Elemen input untuk memilih opsi dengan mencentang kotak.
    -Radio: Elemen input untuk memilih salah satu dari beberapa opsi yang tersedia.
    -Switch: Elemen input yang berfungsi sebagai toggle switch untuk pilihan "aktif" atau "tidak aktif".
    -Slider: Elemen input untuk memilih nilai dalam rentang tertentu (misalnya volume suara).
    -DatePicker atau TimePicker: Elemen ini memungkinkan pengguna memilih tanggal atau waktu.

saya tidak memakai elemen di atas karena input form yang dibutuhkan hanya teks dan angka

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? 
Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Untuk menjaga konsistensi tampilan, saya mengatur tema aplikasi menggunakan ThemeData dalam widget MaterialApp. 
Dengan ThemeData, kita bisa mengatur warna utama (primaryColor), warna aksen (accentColor), gaya teks, dan elemen lain seperti tampilan tombol (ButtonStyle). Hal ini memungkinkan semua elemen aplikasi menggunakan tema yang seragam, sehingga terlihat lebih konsisten.

Contoh penerapan:

dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
  ),
);

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi di Flutter diatur menggunakan Navigator dan Route. Pada aplikasi ini, saya menggunakan Navigator.push untuk berpindah halaman, misalnya dari halaman utama ke halaman form. 
Pada aplikasi dengan lebih banyak halaman, Navigator.pushNamed dengan daftar rute (routes) dalam MaterialApp dapat digunakan untuk memudahkan navigasi. 
Untuk navigasi yang sering digunakan, saya bisa menambahkan Drawer atau BottomNavigationBar sebagai navigasi tetap di bagian bawah atau samping aplikasi.
