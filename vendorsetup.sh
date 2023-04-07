#!/bin/bash
echo -e "\033[33mDeseja clonar as dependências? (s/n)\n\033[0m"
read resposta

if [ "$resposta" = "s" ]; then
echo -e "\033[32mInicializando...\033[0m"
# Vendor
echo ""
git clone -b thirteen git@github.com:Team-NoobMaster69/vendor_motorola_jeter.git vendor/motorola/jeter
echo ""

# Kernel
echo ""
git clone -b aljeter-337 git@github.com:Team-NoobMaster69/kernel_motorola_msm8937.git kernel/motorola/msm8937
echo ""

# Dependencies
echo ""
git clone -b lineage-18.1 https://github.com/LineageOS/android_external_sony_boringssl-compat external/sony/boringssl-compat
git clone -b lineage-20 https://github.com/LineageOS/android_system_qcom system/qcom
git clone -b lineage-20 https://github.com/LineageOS/android_hardware_motorola hardware/motorola
echo ""

# DtbTools Lineage
echo ""
mkdir out/
mkdir out/host/
mkdir out/host/linux-x86/
mkdir out/host/linux-x86/bin
cd out/host/linux-x86/bin
wget -c https://github.com/krasCGQ/scripts/raw/master/prebuilts/bin/dtbToolLineage
chmod +777 dtbToolLineage
cd ../../../..
echo ""

# HAL's
cd hardware/qcom-caf/msm8996/audio
git status | tee gitdata.txt
if
grep -q lineage-20.0-caf-msm8996 "gitdata.txt" ; then
echo -e "\033[32mTudo no seu devido lugar, Boa compilação!!\n\033[0m"
rm -rf gitdata.txt
cd ../../../..
else
echo -e "\033[33mClonando as HALs...\033[0m"
rm -rf hardware/qcom-caf/msm8996/audio
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/media
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/media
rm -rf hardware/qcom-caf/msm8996/display
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/display
echo -e "\033[32m Tudo no seu devido lugar, Boa compilação!!\n\033[0m"
 fi
else
echo -e "\033[31mAs dependências foram puladas!!\n\033[0m"
fi

echo -e "\033[32mSelecione uma opção:\033[0m"
echo -e "\033[33m1 - Compilar em user\033[0m"
echo -e "\033[33m2 - Compilar em userdebug\033[0m"
echo -e "\033[33m3 - Compilar em eng\033[0m"
echo -e "\033[33m4 - Não compilar agora\033[0m"
read opcao;
if [ $opcao = "1" ];
then
lunch lineage_jeter-user
make installclean
make bacon -j$(nproc --all)
elif [ $opcao = "2" ];
then
lunch lineage_jeter-userdebug
make installclean
make bacon -j$(nproc --all)
elif [ $opcao = "3" ];
then
lunch lineage_jeter-eng
make installclean
make bacon -j$(nproc --all)
elif [ $opcao = "4" ];
then
echo -e "\033[32mOk, não irei compilar sem sua autorização!\n\033[0m"
fi
