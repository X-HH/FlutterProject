
echo "Clean old build"
find . -d -name "build" | xargs rm -rf
flutter clean
rm -rf build
rm -rf build_for_ios

echo "开始获取 packages 插件资源"
flutter packages get

echo "开始构建 release for ios"
flutter build ios --release 
echo "构建 release 已完成"

echo "开始 处理framework和资源文件"
mkdir build_for_ios


cp -r build/ios/Release-iphoneos/*/*.framework build_for_ios
cp -r ios/Flutter/App.framework build_for_ios
cp -r ios/Flutter/Flutter.framework build_for_ios
cp -r ios/Runner/GeneratedPluginRegistrant.* build_for_ios



