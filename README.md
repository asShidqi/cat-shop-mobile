# Tugas 9

## 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?  
- **Alasan membuat model**: Model mempermudah proses pengolahan data JSON dengan mengonversi data ke dalam objek yang dapat diakses secara langsung dalam kode. Hal ini membuat struktur data lebih terorganisir dan mudah digunakan.
- **Error tanpa model**: Tidak akan selalu terjadi error jika tidak menggunakan model, namun pengolahan data menjadi lebih kompleks karena kita harus melakukan parsing manual setiap kali memproses data JSON.

## 2. Jelaskan fungsi dari library `http` yang sudah kamu implementasikan pada tugas ini.  
- Library **`http`** digunakan untuk melakukan request ke server, baik GET untuk mengambil data maupun POST untuk mengirim data. Library ini menyediakan metode sederhana untuk berkomunikasi dengan API menggunakan protokol HTTP.

## 3. Jelaskan fungsi dari `CookieRequest` dan jelaskan mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.  
- **Fungsi CookieRequest**: Digunakan untuk mengelola request HTTP yang membutuhkan autentikasi berbasis cookie. Library ini mempermudah pengelolaan sesi pengguna dengan cara menyimpan dan mengirim cookie yang diterima dari server.
- **Pembagian instance**: Instance perlu dibagikan agar status autentikasi tetap konsisten di seluruh komponen aplikasi. Hal ini memungkinkan pengguna tetap login tanpa harus melakukan autentikasi ulang setiap kali berpindah halaman.

## 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.  
- **Input data**: Pengguna mengisi data melalui form input di Flutter. Data ini dikirim ke server menggunakan request POST.  
- **Pengolahan di server**: Server (Django) memproses data tersebut dan menyimpannya dalam database.  
- **Mengambil data**: Flutter melakukan request GET untuk mengambil data JSON dari server.  
- **Tampilan**: Data JSON dikonversi menjadi objek menggunakan model, kemudian ditampilkan ke pengguna melalui widget.

## 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout.  
- **Login**: Flutter mengirimkan data username dan password ke server Django melalui request POST. Server memvalidasi data dan mengembalikan cookie autentikasi jika valid. Cookie ini disimpan oleh `CookieRequest`.  
- **Register**: Data akun baru dikirim ke server melalui request POST. Server membuat akun baru dalam database, dan pengguna dapat login menggunakan akun tersebut.  
- **Logout**: Flutter mengirim request ke endpoint logout di server. Server menghapus cookie autentikasi, sehingga sesi pengguna berakhir. Setelah logout, menu di Flutter tidak lagi menampilkan data pengguna.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. membuat fitur registrasi akun dengan membuat form menggunakan `TextFormField` untuk username, email, dan password, lalu mengirimkan data tersebut ke server Django melalui endpoint API menggunakan request POST dari library `http`.  
2. membuat halaman login dengan menambahkan form untuk username dan password, kemudian mengirimkan data login ke server Django untuk proses autentikasi menggunakan request POST.  
3. mengintegrasikan sistem autentikasi Django dengan Flutter menggunakan instance `CookieRequest` untuk menyimpan sesi login pengguna, sehingga pengguna tetap login selama sesi masih aktif.  
4. membuat model kustom di Django untuk mencocokkan struktur data yang dibutuhkan oleh aplikasi Flutter, seperti atribut nama, harga, dan deskripsi.  
5. membuat halaman daftar item di Flutter yang menampilkan data dari endpoint JSON di Django, termasuk atribut name, price, dan description, dengan menggunakan widget `ListView` untuk menyusun daftar.  
6. membuat halaman detail untuk setiap item yang dapat diakses dengan menekan salah satu item pada halaman daftar, dan menampilkan seluruh atribut item menggunakan widget seperti `Text` dan `Container`, serta menambahkan tombol untuk kembali ke halaman daftar.  
7. menambahkan filter pada halaman daftar item untuk hanya menampilkan item yang terkait dengan pengguna yang sedang login, dengan cara memeriksa atribut user pada setiap item di endpoint JSON.

# Tugas 8

## Jelaskan apa kegunaan `const` di Flutter. Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
- **Kegunaan `const` di Flutter**: `const` digunakan untuk membuat objek yang sifatnya **konstan dan tidak berubah** selama aplikasi berjalan.
- **Keuntungan menggunakan `const`**: `const` membantu menghemat **memori** dan **meningkatkan performa** karena widget yang menggunakan `const` tidak akan dirender ulang.
- **Kapan sebaiknya menggunakan `const`**: `const` untuk widget atau objek yang nilainya tidak akan berubah, misalnya teks statis atau ikon yang tidak bergantung pada data dinamis.
- **Kapan sebaiknya tidak digunakan**: saat ada widget yang nilainya bisa berubah berdasarkan data atau interaksi pengguna.

## Jelaskan dan bandingkan penggunaan `Column` dan `Row` pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
- **Column**: Digunakan untuk menyusun widget secara vertikal dari atas ke bawah.
- **Row**: Digunakan untuk menyusun widget secara horizontal dari kiri ke kanan.

**Contoh Implementasi:**
- `Column`:
  ```dart
    child: const Column(
        children: [
        Text(
            'Cat Shop',
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Text(
            "Ayo jual kucing yang mengganggu dirumahmu disini!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
            ),
        ),
        ],
    ),
  ```
- `Row`:
  ```dart
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        InfoCard(title: 'NPM', content: npm),
        InfoCard(title: 'Name', content: name),
        InfoCard(title: 'Class', content: className),
        ],
    ),
  ```

## Sebutkan elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
- **Elemen Input yang Digunakan**: `TextField` (untuk teks input pengguna), `ElevatedButton` (untuk save)
- **Elemen Input yang Tidak Digunakan**: Ada beberapa elemen lain yang tersedia di Flutter seperti `Slider` (untuk nilai yang bisa diseret), `Switch` (untuk opsi on/off), `RadioButton` (untuk pilihan tunggal di antara beberapa opsi), dan `DropdownButton` (untuk menampilkan daftar pilihan). Elemen-elemen ini belum digunakan karena tidak sesuai dengan kebutuhan form yang dibuat.

## Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
- **Pengaturan Tema di Flutter**: Tema dapat diatur menggunakan `ThemeData` dalam widget `MaterialApp`. Ini memungkinkan kita mengatur warna, font, dan style yang konsisten di seluruh aplikasi.
- **Implementasi di Aplikasi**: Ya, dalam aplikasi ini menggunakan tema yang konsisten terutama untuk:
    - Warna yang konsisten untuk button (contohnya di `ItemCard`)
    - Style teks yang konsisten (seperti pada `Text` widget di `Column`)
    - Padding dan layout yang seragam dalam aplikasi

## Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
- **Navigator**: Navigasi diimplementasikan menggunakan `Navigator` untuk berpindah antar halaman. dapat menggunakan `Navigator.push` untuk menambah halaman dari stack, `Navigator.pushReplacement` untuk mengganti halaman sat ini dengan halaman baru dengan menghapus halaman lama dari stack navigasi, dan `Navigator.pop` untuk menghapus halaman dari stack

# Tugas 7
## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- stateless widget adalah widget yang tidak terikat dengan interaksi pengguna maupun variable dan nilai yang ditemukan.
- stateful widget adalah widget yang dapat berubah karena ada interaksi dari pengguna maupun variable dan nilai yang ditemukan.
- perbedaan antara keduanya adalah widget stateless berlaku statis dimana interkasi pengguna tidak merubah widgetnya sedangkan stateful bersifat dinamis sehingga widget dapat diperbaharui berdasarkan user interaction atau ketika terjadi perubahan data.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- **Scaffold**: Menyediakan struktur dasar visual untuk material design.
- **AppBar**: Menampilkan bar di bagian atas aplikasi yang biasanya berisi judul dan tindakan.
- **Text**: Menampilkan teks dengan gaya tertentu.
- **Container**: Menyediakan kotak persegi panjang yang fleksibel untuk menampung widget lain.
- **Column**: Menyusun widget anak secara vertikal.
- **Row**: Menyusun widget anak secara horizontal.
- **ListView**: Menampilkan daftar widget yang dapat digulir.
- **Image**: Menampilkan gambar dari berbagai sumber.
- **Icon**: Menampilkan ikon dari material design atau ikon kustom.
- **RaisedButton**: Menampilkan tombol yang dapat ditekan dengan efek elevasi.
- **TextField**: Menyediakan input teks dari pengguna.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
- **setState()** adalah metode yang digunakan dalam stateful widget untuk memberitahu framework bahwa ada perubahan pada state yang perlu diperbarui. Ketika setState() dipanggil, widget akan dirender ulang dengan nilai state yang baru.
- Variabel yang dapat terdampak oleh setState() adalah semua variabel yang berada dalam class state dari stateful widget tersebut. Variabel-variabel ini biasanya digunakan untuk menyimpan data yang dapat berubah dan mempengaruhi tampilan widget.

## Jelaskan perbedaan antara const dengan final.
- **const**: Digunakan untuk mendeklarasikan nilai yang bersifat konstan dan harus diketahui pada waktu kompilasi. Nilai yang dideklarasikan dengan const tidak dapat diubah dan bersifat tetap selama runtime.
- **final**: Digunakan untuk mendeklarasikan nilai yang hanya dapat diinisialisasi sekali dan nilainya tidak dapat diubah setelah diinisialisasi. Nilai final dapat diinisialisasi pada waktu runtime, tidak seperti const yang harus diinisialisasi pada waktu kompilasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
- pertama buat flutter create cat_shop_mobile untuk membuat project flutter baru
- kemudian buat new file menu.dart untuk tampilan menunya
- pisahkan untuk bagian menu di folder menu dan main hanya untuk melakukan runapp nya
- implementasikan class MyHomepage, ItemHomepage, InfoCard(untuk menampilkan npm, nama, dan kelas), dan ItemCard(untuk menampilkan button button daftar produk, tambah produk, logout)
- didalam class ItemCard implementasikan ontap sehingga ketika di klik buttonnya akan muncul snackbar
- tambahkan conditional untuk warna-warnanya agar setiap button memiliki warna yang berbeda
- buat repositori baru digithub dengan nama cat-shop-mobile git add-commit-push project kita ke repositori yang telah dibuat