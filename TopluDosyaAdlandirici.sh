#!/bin/bash

if [ -z $1 ]
then
	dizin=`pwd`
else
	dizin=$1
fi


dosyaUzantisi=$(whiptail --inputbox "Dosya uzantisi giriniz. (Ornegin: jpg, tar.gz)" 10 50 3>&1 1>&2 2>&3)

dosyalari_hazirla () {
	donguSayisi=`expr $dosyaSayisi - 1`

	i=0
	increase=1
	
	 if (whiptail --yesno "$dosyaUzantisi uzantili $dosyaSayisi dosya bulundu. Hepsini secmek ister misiniz?" 10 50) then
  		while [ $i -ne $dosyaSayisi ]
	do
		dosyaListesi+=("${dosyalar[$i]}" "" ON)
		i=`expr $i + $increase`
	done
	else
  		while [ $i -ne $dosyaSayisi ]
	do
		dosyaListesi+=("${dosyalar[$i]}" "" OFF)
		i=`expr $i + $increase`
	done
	fi
}

dosya_adi_degistir () {
	CHOICE=$(whiptail --title "$dosyaUzantisi Uzantili Dosyalar" --checklist \
	"Adini degistirmek istediginiz dosyalari seciniz." 15 60 4 \
	"${dosyaListesi[@]}" 3>&1 1>&2 2>&3)
	
	if [ -z "$CHOICE" ]
	then
  		echo "Islem iptal edildi. (Cancel)"
  		exit
	else
	
		dosyaOnEki=$(whiptail --inputbox "Dosyaya eklemek istediginiz on eki giriniz. (Ornegin: resim, video, dosya)" 10 50 3>&1 1>&2 2>&3)
		
  		x=1
  		
  		for FILE in $CHOICE
  		do		
  			dosyaninYeniAdi="$dizin/$dosyaOnEki$x.$dosyaUzantisi\""
  			dosyaninYeniAdi=`echo "$dosyaninYeniAdi" | tr -d "\042"`
  			FILE=`echo "$dizin/$FILE" | tr -d "\042"`
  			`mv $FILE $dosyaninYeniAdi`
  			x=`expr $x + 1`
  		done
  		
  		echo "DOSYALAR: `ls $dizin`"
  		echo "SONUC: Ad degistirme islemi basariyla tamamlandi."
	fi	
}

dosya_uzantisi_degistir () {
	CHOICE=$(whiptail --title "$dosyaUzantisi Uzantili Dosyalar" --checklist \
	"Uzantisini degistirmek istediginiz dosyalari seciniz." 15 60 4 \
	"${dosyaListesi[@]}" 3>&1 1>&2 2>&3)
	
	if [ -z "$CHOICE" ]
	then
  		echo "Dosya secilmedi. (Cancel)"
  		exit
	else
	
	dosyaninYeniUzantisi=$(whiptail --inputbox "Dosyanin yeni uzantisi giriniz (ornegin: jpg, tar.gz)" 10 50 3>&1 1>&2 2>&3)

  		x=1
  		
  		for FILE in $CHOICE
  		do		
  			dosyaninYeniAdi="$dizin/${FILE%.*}.$dosyaninYeniUzantisi\""
  			dosyaninYeniAdi=`echo "$dosyaninYeniAdi" | tr -d "\042"`
  			FILE=`echo "$dizin/$FILE" | tr -d "\042"`
  			`mv $FILE $dosyaninYeniAdi`
  			x=`expr $x + 1`
  		done
  		
  		echo "DOSYALAR: `ls $dizin`"
  		echo "SONUC: Uzanti degistirme islemi basariyla tamamlandi."
	fi
}

menu () {
CHOICE=$(whiptail --menu "Dosya Islemleri" 18 70 10 \
  "Ad Degistir" "(araba.jpg, manzara.jpg > resim1.jpg, resim2.jpg)" \
  "Uzanti Degistir" "(tatil.mp4, okul.mp4 > tatil.mov, video2.mov)" 3>&1 1>&2 2>&3)
  	if [ -z "$CHOICE" ] 
	then
  		echo "Islem secilmedi. (Cancel)"
  		exit
	else
  		case $CHOICE in
  		"Ad Degistir")
  			dosyalari_hazirla
  			dosya_adi_degistir
  		;;
  		"Uzanti Degistir")
  			dosyalari_hazirla
  			dosya_uzantisi_degistir	
  		;;
  		*)
  		echo "Gecersiz islem secildi."
  		exit
  		;;
		esac  
	fi
}

if [ -z "$dosyaUzantisi" ]
then
	echo "Dosya uzantisi bos olamaz."
	exit
else
	dosyalar=( `ls $dizin | grep "\.$dosyaUzantisi"` )
	dosyaSayisi=`echo ${#dosyalar[@]}`
	
	if [ "$dosyaSayisi" -ne 0 ]
	then
		menu
	else
		echo ".$dosyaUzantisi uzantılı dosya bulunamadi ($dizin)."
		echo "Dizin belirtmek icin komut: 'bash TopluDosyaAdlandirici.sh (dizin)'"
		exit
	fi
fi
