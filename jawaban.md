# Jawaban

1.  mulai pertama kali menggunakan swift tahun 2017, ikut binar academy selama dua bulan. namun untuk real project mulai desember 2019 sampai april 2019 bekerja di koinworks.
2. library swift yg sering di paka 
<br/><br/> a. alamofire (http networking) merupakan sebuah library networking, dalam penggunaannya biasanya digunakan untuk handle rest api<br/><br/>
b. SDWebImage, library provides async image downloader, dalam penggunaanya saya gunakan untuk load image dari url<br/><br/>
c. Firebase/Auth, digunakan untuk auth google service, biasanya saya gunakan untuk login menggunakan firebase<br/><br/>
d. firebase/firestore, digunakan untuk menggunakan layanan google cloud firestore<br/><br/>
e. Firebase/Messaging, digunakan untuk push notif di ios<br/><br/>
f. firebase/crashlytics, digunakan untuk report crash pada aplikasi, dapat membantu dalam tracking bug, prioritas bug.<br/><br/>
g. firebase/remoteconfig, digunakan untuk mendefinisikan parameter dan dapat di ubah di cloud firebase, biasanya di gunakan untuk nonaktif fitur di aplikasi tanpa harus update aplikasi, misal ada fitur A, dipasang remote config, bisa di nonaktifkan dengan remote config<br/><br/>
h. clevertap, digunakan untuk tim marketing biasanya untuk tracking pengguna, sejauh mana mereka menggunakan aplikasi. jadi data tersebut dapad digunakan untuk di analisa tim marketing atau tim produk untuk perkembangan aplikasi kedepannya

3. cleancode, code yang simple dan mudah di pahami, desaign pattern yg saya pakai modular, namun saat ini sedang mempelajari mvvm & viper. yg saya gunakan di aplikasi ini. memisahkan antara model,service,dan controller view, 
membuat fungsi seefisien mungkin dan dapat digunakan kembali, reusable

4. pertama kali realproject swift baru sekitar 5 bulan yang lalu, tantangan terbesar saya yaitu memulai di awal minggu pertama kali bekerja, harus menyesuaikan dengan code yang sudah ada, penggunaan library firebase, network service alamofire. membuat code seminimal mungkin dan membuat fungsi yg reusable. nyobain unit testing. untuk menyelesaikan task yg sulit biasanya cari stackoverflow dan tanya kepada senior kalau sudah mentok ga nemu.

5. workfow menggunakan gitflow, setiap tim menggunakan branch masing”, dan masing” dalam tim untuk membuat branch berdasarkan branch pertim, yaitu membuat branch perfungsi. setelah masing” fungsi selesai dan sudah dicoba,, merge dari branch develop, sysc code yang sudah ada update dari branchd develp sebelum melakukan pull request ke develop. setelah itu dari branch develop di build ipa atau build langsung ke hp tester. kalo udah oke pull request ke master. kalo masih ada kesalahan di perbaiki di branch per fungsi tadi, kemudian ulangi langkah seprti di atas. setelah bener” fix  branch td bisa di hapus.

6. meningkatkan performa dan security swift<br/><br/>a. meningkatkan performa coding di swift, gunakan coding seminimal mungkin, hapus yang tidak terpakai,kurangi penggunaan storyboard, bisa menggunakan xib. dan paling bagus menggunakan auto layout programmatically(karena tidak menggunakan layout builder, langsung full code jadi aplikasi bisa enteng dalam sisi develop dan performa), reuse view, image asset yg digunakan kalau bisa berukuran kecil, penggunaan cache, handle memory warning
<br/><br/>
b. data protecton rest api, biasanya gunakan user auth untuk pengamanan rest api yg digunakan, gunakan keychan (menympan data yang bersifat penting,seperti password. jadi password akan di enkripsi), menggunakan htpps untuk request method, SSL Certificate Pinning 



