# teste_softdesign

A project to a job opportunity of mobile developer with Flutter

### :star: Compilação Bundle release da loja android

```sh
    flutter build appbundle
```

### :star2: Compilação APK release com ofuscação de codigo

```sh
    flutter build apk --split-per-abi --release
```

## :gear: Flutter Setup
```sh
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build
    flutter run
```

## :bulb: Caso algo não estiver funcionando adequadamente
```sh
    flutter clean
    rm -rf pubspec.lock
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter run
```

### :star: Executar os testes de unidade

```sh
    flutter test test/folder/file_name.dart
    flutter test test/folder/
    flutter test test/
```

Cores utilizadas:

- Very Light Grey ![#CCCCCC](https://via.placeholder.com/15/CCCCCC/000000?text=+) `#CCCCCC`
- White Smoke ![#F5F5F5](https://via.placeholder.com/15/F5F5F5/000000?text=+) `#F5F5F5`
- Dark Gray ![#AAAAAA](https://via.placeholder.com/15/AAAAAA/000000?text=+) `#AAAAAA`
- Alizarin ![#EC1D24](https://via.placeholder.com/15/EC1D24/000000?text=+) `#EC1D24`
- Nero ![#242323](https://via.placeholder.com/15/242323/000000?text=+) `#242323`

##### Pacotes utilizados

<ul>
    <li>flutter_native_splash</li>
    <li>injectable_generator</li>
    <li>shimmer_animation</li>
    <li>connectivity_plus</li>
    <li>cupertino_icons</li>
    <li>flutter_lints</li>
    <li>flutter_mobx</li>
    <li>mobx_codegen</li>
    <li>build_runner</li>
    <li>flutter_i18n</li>
    <li>injectable</li>
    <li>equatable</li>
    <li>platform</li>
    <li>provider</li>
    <li>mocktail</li>
    <li>mockito</li>
    <li>get_it</li>
    <li>crypto</li>
    <li>dartz</li>
    <li>mobx</li>
    <li>test</li>
    <li>file</li>
    <li>http</li>
</ul>