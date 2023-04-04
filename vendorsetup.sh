# Clone/Fetch Upstream Device Dependencies

echo "cloning vendor blobs"
git clone -b thirteen git@github.com:Team-NoobMaster69/vendor_motorola_jeter.git vendor/motorola/jeter
echo ""

# Kernel
echo "cloning kernel"
git clone -b aljeter-337 git@github.com:Team-NoobMaster69/kernel_motorola_msm8937.git kernel/motorola/msm8937
echo ""

# DtbTools lineage
echo "cloning dtbTools lineage"
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
echo "Cloning Hals"
git clone https://github.com/aospa-vince/android_hardware_qcom_audio -b topaz-8953 vendor/qcom/opensource/audio-hal/primary-hal
git clone https://github.com/aospa-vince/android_hardware_qcom_media -b topaz-8953 hardware/qcom/media
git clone https://github.com/aospa-vince/android_hardware_qcom_display -b topaz-8953 hardware/qcom/display
echo ""
