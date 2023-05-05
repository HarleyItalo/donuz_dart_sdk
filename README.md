## DONUZ Dart SDK 

A Sdk foi criada com o proposito de facilitar o uso para os clientes da Donuz com uma forma intuitiva de utilizar as apis e facilitar o desenvolvimento de aplicações com flutter/dart


## Instalação

a) Add in your pubspec.yaml:
   ```sh
   dependencies:
   donuz_dart_sdk: <last-version>
   ```
or use:
   ```sh
   dart pub add donuz_dart_sdk
   ```

b) Run: 
```sh
    flutter pub get
```

c) init SDK:

```Dart

late DonuzSDK donuzSDK;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  donuzSDK = DonuzSDK(
      client: http.Client(),
      config: DonuzConfig(donuzToken: '<YOUR TOKEN>', appId: '<YOUR APPID>'));
  await donuzSDK.init();

  runApp(const MyApp());
}

```

## Examples

```Dart
    donuzSDK.establisment.findEstablishmentById();
```
Retorna as informações do estabelecimento informado no appId na configuracão da sdk

```Dart
    await donuzSDK.prizes.getPrizes();
```

Retorna todos os prêmios cadastrados. 

```Dart
   await donuzSDK.user.makeLogin(username: '12345678909',password: '12345678909');
```

Faz o Login do Usuario
```Dart
   await donuzSDK.user.makeLogin(username: '12345678909',password: '12345678909');
```

Faz o Logout
```Dart
  await donuzSDK.user.makeLogout();
```




