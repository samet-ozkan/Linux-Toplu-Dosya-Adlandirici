# Linux Toplu Dosya Adlandirici

# TR
Linux Araçları ve Kabuk Programlama dersi proje ödevi.

TUI ile seçilen dosyaların isimlerini ve uzantılarını değiştirebilen Linux scripti.

### Ad değiştirme örneği:
Dosyalar: araba.jpg, manzara.jpg, tatil.jpg, ev.jpg, okul.jpg
\
Script ile seçilen dosyalar: araba.jpg, ev.jpg, okul.jpg
\
Belirtilen ön ek: resim
\
İşlem sonucu dosyalar: resim1.jpg, manzara.jpg, tatil.jpg, resim2.jpg, resim3.jpg

### Uzantı değiştirme örneği:
Dosyalar: araba.jpg, manzara.jpg, tatil.jpg, ev.jpg, okul.jpg
\
Script ile seçilen dosyalar: Hepsi
\
Belirtilen yeni uzantı: png
\
İşlem sonucu dosyalar: araba.png, manzara.png, tatil.png, ev.png, okul.png

## Başlangıç:
```sh 
git clone https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici.git
cd Linux-Toplu-Dosya-Adlandirici
chmod +x TopluDosyaAdlandirici.sh
bash TopluDosyaAdlandirici.sh (dizin)
```
**Not:** (dizin) kısmına değiştirilmek istenen dosyaların bulunduğu dizin girilmelidir.
\
**Örnek komut:** bash TopluDosyaAdlandirici.sh ~/Downloads/Ornek-Dosyalar
\
Eğer boş bırakılırsa mevcut dizin argüman olarak kabul edilecektir.

## Adım 1: Dosya Uzantısı
Kullanıcı, üzerinde işlem yapacağı dosyaların uzantısını girer. Uzantı kısmı boş bırakılamaz.
\
**Not:** Uzantının başına "." konulmamalıdır. (Örneğin: txt yerine .txt yazılırsa hata alınacaktır.)
\
<img src="https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici/blob/main/Screenshots/Screenshot%20from%202023-01-05%2022-13-43.png" width="700" height="500" />

## Adım 2: Dosya İşlemleri
Kullanıcı yapmak istediği işlemi seçer.
\
<img src="https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici/blob/main/Screenshots/Screenshot%20from%202023-01-05%2022-13-57.png" width="700" height="500" />

## Adım 3: Toplu Dosya Seçimi 
Kullanıcı, seçtiği dizinde bulunan ve belirttiği uzantıya sahip olan dosyaların hepsini seçebilir. 
\
"NO" yanıtı sonrası dosyaların hiçbiri seçili olarak gelmeyecektir.
\
<img src="https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici/blob/main/Screenshots/Screenshot%20from%202023-01-05%2022-14-06.png" width="700" height="500" />

## Adım 4: Dosya Seçim
Belirtilen dizinde aynı uzantıya sahip dosyalar arasından seçim yapılabilir.
\
<img src="https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici/blob/main/Screenshots/Screenshot%20from%202023-01-05%2022-14-11.png" width="700" height="500" />

## Adım 5 (Ad Değiştirme): Dosyaya Ön Ek Ekleme
Ad değiştirme işlemi için dosyalara ön ek eklenebilir. Ön ek boş bırakılırsa dosyalar 1, 2, 3... şeklinde isimlendirilir.
\
<img src="https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici/blob/main/Screenshots/Screenshot%20from%202023-01-05%2022-14-41.png" width="700" height="500" />

## Adım 5 (Uzantı Değiştirme): Yeni Uzantıyı Belirleme
Uzantı değiştirme işlemi için kullanıcı seçtiği dosyaların yeni uzantısını belirtir.
\
<img src="https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici/blob/main/Screenshots/Screenshot%20from%202023-01-05%2022-51-14.png" width="700" height="500" />

## Sonuc
Dizindeki dosyalar ve işlem sonucu terminalde gösterilir. 
\
<img src="https://github.com/samet-ozkan/Linux-Toplu-Dosya-Adlandirici/blob/main/Screenshots/Screenshot%20from%202023-01-05%2022-15-26.png" width="700" height="500" />

## Eksikler
- Dosya isminde boşluk karakteri bulunması durumunda script doğru çalışmaz.
- Kullanıcı dosya uzantısının başına "." koyarsa hata alır.

## İletişim
<p>Email: <a href="mailto:samet-ozkan@outlook.com">samet-ozkan@outlook.com</a></p>
