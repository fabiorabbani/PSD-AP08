# IEEE 802.3 Ethernet II Frame Parser
Ethernet II frame parser adalah program untuk menguraikan paket data jaringan menjadi beberapa bagian, yaitu MAC Address dari perangkat asal dan perangkat tujuan serta Ethertype. Program ini juga memiliki fitur Intrusion Detection System yang akan mendeteksi apabila paket data mencurigakan berdasarkan MAC Address dari perangkat tujuan dan Ethertype, IDS kemudian akan memberikan indikasi adanya potensi pelanggaran keamanan.

## Cara Kerja
User menginput header dari frame Ethernet II, kemudian akan diparse sehingga dapat lebih mudah melihat source address, destination address, dan apa Ethertype dari paket data terebut. Lalu terdapat intrusion detection system dengan melihat hubungan antara destination address dengan jenis paket data (Ethertype).
Program ini memiliki 5 state yaitu Idle, Fetch, Parse, Detect, Complete.
![Untitled Diagram drawio (49)](https://github.com/fabiorabbani/PSD-AP08/assets/135633116/e7146d09-f3e5-4f46-bd4a-f7ae2df7a3f9)

## Pengujian Kode (ModelSim\)
- Input: 1111111111111111111111111111111111111111111111110000000000011010001010110011110001001101010111100000100000000000
- Clock: Falling Edge

![Screenshot 2023-12-24 232553](https://github.com/fabiorabbani/PSD-AP08/assets/135633116/5f959900-4dfe-4597-ab29-465f5ebb0776)

## Sintesis RTL (Quartus\)
<img width="980" alt="Sintesis RTL" src="https://github.com/fabiorabbani/PSD-AP08/assets/116070980/7f44b6e0-7395-4441-b73d-eb77e8ecfa75">

## Kontributor
- [Darmawan Hanif](https://github.com/drmwnhnf) - Penulisan Kode dan Sintesis RTL
- [Fabio Rabbani Prasetyo](https://github.com/fabiorabbani) - Pembuatan Testbench dan Pengujian Kode
- Fathia Zulfa Alfajr - Dokumentasi
- Kevin Naufal - Penulisan Kode

## Special Thanks
- Bang Jordhie selaku aslab
- Digilab DTE FTUI selaku laboratorium penyedia
- Kopi Kapal Api
