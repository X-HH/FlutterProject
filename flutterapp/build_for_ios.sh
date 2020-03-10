
echo "Clean old build"
find . -d -name "build" | xargs rm -rf
flutter clean
rm -rf build
rm -rf build_for_ios

echo "开始获取 packages 插件资源"
flutter packages get

echo "开始构建 release for ios"
FLUTTER_BUILD_MODE=release
flutter build ios --release 
echo "构建 release 已完成"
mkdir ./build/release
cp -a ios/Flutter/App.framework ./build/release

echo "开始构建 —simulator for ios"
FLUTTER_BUILD_MODE=debug
flutter build ios --simulator
echo "构建 —simulator 已完成"
mkdir ./build/debug
cp -a ios/Flutter/App.framework ./build/debug

mkdir ./build/des
lipo -create ./build/debug/App.framework/App  ./build/release/App.framework/App -output ./build/des/App

lipo -create ./build/ios/Debug-iphonesimulator/shared_preferences/shared_preferences.framework/shared_preferences  ./build/ios/Release-iphoneos/shared_preferences/shared_preferences.framework/shared_preferences -output ./build/des/shared_preferences

echo "开始 处理framework和资源文件"
mkdir build_for_ios

cp -a ./build/debug/App.framework ./build/des
# rm -rf ./build/des/App.framework/App
cp -a ./build/des/App ./build/des/App.framework

cp -a ./build/ios/Debug-iphonesimulator/shared_preferences/shared_preferences.framework ./build/des
cp -a ./build/des/shared_preferences ./build/des/shared_preferences.framework
# rm -rf ./build/des/App

cp -r ./build/des/*.framework build_for_ios
cp -r ios/Runner/GeneratedPluginRegistrant.* build_for_ios



