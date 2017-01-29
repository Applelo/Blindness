#!/bin/bash
BASEDIR=$(dirname "$BASH_SOURCE")
cd $BASEDIR
mkdir "psp"
mkdir "psvita"
files=('*.lua' '*.ini')

# Build PSP
echo -e "\033[0mBuild for PSP"
PSP=$BASEDIR'/psp'
for i in `seq 0 1`;
do
  echo -e "\033[32m" ${files[$i]} ".................copied"
  cp ${files[$i]} $PSP
done
echo -e "\033[32m ubuntu-font .................copied"
cp "ubuntu-font.pgf" $PSP
echo -e "\033[32m music .................copied"
cp -r "music" $PSP
echo -e "\033[32m img .................copied"
cp -r "img" $PSP
echo -e "\033[32m EBOOT.PBP .................copied"
cp "EBOOT.PBP" $PSP

echo -e "\033[0mCreate Zip\033[32m"
cd $PSP
7z a -tzip ../Blindness-PSP.zip -r *
echo -e "\033[0mRemove PSP folder"
cd $BASEDIR
rm -r "psp"

# Build PSVita
echo -e "\033[0mBuild for PSVita"
PSVITA=$BASEDIR'/psvita'
for i in `seq 0 1`;
do
  echo -e "\033[32m" ${files[$i]} ".................copied"
  cp ${files[$i]} $PSVITA
done
echo -e "\033[32m ubuntu-font .................copied"
cp "ubuntu-font.ttf" $PSVITA
echo -e "\033[32m music .................copied"
cp -r "music" $PSVITA
echo -e "\033[32m img .................copied"
cp -r "img" $PSVITA
echo -e "\033[32m sce_sys .................copied"
cp -r "sce_sys" $PSVITA
echo -e "\033[32m eboot.bin .................copied"
cp "eboot.bin" $PSVITA

#Resize all image 200%
echo -e "\033[0mResize img for PSVita version"
cd $PSVITA'/img/menu'
for file in *.png; do
  echo -e "\033[32m $file .................resized"
  convert $file -resize '200%' $file
done
cd $PSVITA'/img/oeil'
for file in *.png; do
  echo -e "\033[32m $file .................resized"
  convert $file -resize '200%' $file
done
cd $PSVITA'/img/point'
for file in *.png; do
  echo -e "\033[32m $file .................resized"
  convert $file -resize '200%' $file
done

#Transform to VPK
echo -e "\033[0mCreate VPK\033[32m"
cd $PSVITA"/sce_sys"
#Generate param.sfo
#vita-mksfoex -s TITLE_ID=BLIND0123 Blindness param.sfo
cd $PSVITA
7z a -tzip ../Blindness-Vita.vpk -r * eboot.bin
cd $BASEDIR
echo -e "\033[0mRemove PSVita folder"
rm -r "psvita"
echo -e "\033[0mFinish :)"
