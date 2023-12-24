
# IEEE 802.3 Ethernet II Frame Parser

Ethernet II frame parser adalah program untuk menguraikan paket data jaringan menjadi beberapa bagian, yaitu MAC Address dari perangkat asal dan perangkat tujuan, panjang payload, payload dari paket data, dan frame check sequence. Program ini juga memiliki fitur intrusion verification yang berguna untuk memeriksa apakah MAC address yang terdapat dalam frame merupakan alamat yang diizinkan atau bukan. Apabila MAC address dalam frame tidak sesuai dengan alamat yang diizinkan, maka akan memicu respons yang direalisasikan dengan pengaktifan intrusion_detected_flag, karena sistem menganggapnya sebagai sebuah potensi serangan siber. Intrusion_detected_flag kemudian akan memberikan indikasi adanya potensi pelanggaran keamanan.

## Cara Kerja

User menginput header dari frame ethernet II, kemudian akan diparse sehingga dapat lebih mudah melihat source address, destination address, dan apa ether-type dari paket data terebut. Lalu terdapat intrution detection system dengan melihat hubungan antara destination address dengan jenis paket data (ether-type).
Program ini memiliki 5 state yaitu Idle, Fetch, Parse, Detect, Complete.
![Untitled Diagram drawio (49)](https://github.com/fabiorabbani/PSD-AP08/assets/135633116/e7146d09-f3e5-4f46-bd4a-f7ae2df7a3f9)

Berikut merupakan hasil tes
![Screenshot 2023-12-24 232553](https://github.com/fabiorabbani/PSD-AP08/assets/135633116/5f959900-4dfe-4597-ab29-465f5ebb0776)

Terima Kasih

