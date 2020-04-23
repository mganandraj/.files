#!/bin/bash
################################################################################
##  File:  android.sh
##  Desc:  Installs Android SDK
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh
source $HELPER_SCRIPTS/apt.sh

# Set env variable for SDK Root (https://developer.android.com/studio/command-line/variables)
ANDROID_ROOT=/usr/local/lib/android
ANDROID_SDK_ROOT=${ANDROID_ROOT}/sdk
echo "ANDROID_SDK_ROOT=${ANDROID_SDK_ROOT}" | tee -a /etc/environment

# ANDROID_HOME is deprecated, but older versions of Gradle rely on it
echo "ANDROID_HOME=${ANDROID_SDK_ROOT}" | tee -a /etc/environment

# Download the latest command line tools so that we can accept all of the licenses.
# See https://developer.android.com/studio/#command-tools
wget -O android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip android-sdk.zip -d ${ANDROID_ROOT}
rm -f android-sdk.zip

# Install the following SDKs and build tools, passing in "y" to accept licenses.
echo "y" | ${ANDROID_ROOT}/tools/bin/sdkmanager --sdk_root=${ANDROID_SDK_ROOT} \
    "ndk-bundle" \
    "platform-tools" \
    "platforms;android-29" \
    "platforms;android-28" \
    "platforms;android-27" \
    "platforms;android-26" \
    "platforms;android-25" \
    "platforms;android-24" \
    "platforms;android-23" \
    "platforms;android-22" \
    "platforms;android-21" \
    "platforms;android-19" \
    "platforms;android-17" \
    "build-tools;29.0.2" \
    "build-tools;29.0.0" \
    "build-tools;28.0.3" \
    "build-tools;28.0.2" \
    "build-tools;28.0.1" \
    "build-tools;28.0.0" \
    "build-tools;27.0.3" \
    "build-tools;27.0.2" \
    "build-tools;27.0.1" \
    "build-tools;27.0.0" \
    "build-tools;26.0.3" \
    "build-tools;26.0.2" \
    "build-tools;26.0.1" \
    "build-tools;26.0.0" \
    "build-tools;25.0.3" \
    "build-tools;25.0.2" \
    "build-tools;25.0.1" \
    "build-tools;25.0.0" \
    "build-tools;24.0.3" \
    "build-tools;24.0.2" \
    "build-tools;24.0.1" \
    "build-tools;24.0.0" \
    "build-tools;23.0.3" \
    "build-tools;23.0.2" \
    "build-tools;23.0.1" \
    "build-tools;22.0.1" \
    "build-tools;21.1.2" \
    "build-tools;20.0.0" \
    "build-tools;19.1.0" \
    "build-tools;17.0.0" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" \
    "add-ons;addon-google_apis-google-24" \
    "add-ons;addon-google_apis-google-23" \
    "add-ons;addon-google_apis-google-22" \
    "add-ons;addon-google_apis-google-21" \
    "cmake;3.6.4111459" \
    "patcher;v4"