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