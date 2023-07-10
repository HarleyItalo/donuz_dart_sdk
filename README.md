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
      config: DonuzConfig(donuzToken: '<YOUR TOKEN>', appId: '<YOUR APPID>'));
  await donuzSDK.init();

  runApp(const MyApp());
}

```

## Examples

### Retorna as informações do estabelecimento informado no appId na configuracão da sdk
```Dart
    donuzSDK.establisment.findEstablishmentById();
```



### Retorna todos os prêmios cadastrados. 
```Dart
    await donuzSDK.prizes.getPrizes();
```

### Faz o Login do usuario
```Dart
   await donuzSDK.user.makeLogin(username: '12345678909',password: '12345678909');
```

### Faz o Logout do usuario.
```Dart
  await donuzSDK.user.makeLogout();
```





