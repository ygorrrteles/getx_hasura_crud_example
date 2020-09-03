# Flutter Crud (Getx + Hasura)

_A Flutter crud project based in [Getx](https://pub.dev/packages/get) and [Hasura](https://hasura.io) offering basic structures for future projects._

## Getting Started

### Running this project
#### 1. Verify installable pre-requisites to run:

- [Flutter](https://flutter.dev)
- [Android/IOS Emulator](https://developer.android.com/studio)

#### 2. Deploying a *Hasura* project
First you need to [Sign Up](https://cloud.hasura.io/login?redirect_url=/) Hasura and create a project for free, after configure your project create a table named **produtos** from hasura console on postgress database like bellow

| produtos
-------------
Column      |  Column Type            |Nullable |  Unique  | 
:----------:| ----------------------- |:-------:| :------: |
id          | Integer (auto-increment)|  false  | true     |    
nome        | Text                    |  false  | true*    | 
valor       | Numeric                 |  false  | false    |
In the _unique_ Column **true*** is optional

**Important:** Setup the id like Primary Key

|  Primary Key |
| :-----------:|
|      id      |





#### 3. Running in the Emulator
Open the root directory of this repository in mac/linux/windows **Terminal** and type the following commands:

This command will refresh and download all project dependecies
```
flutter pub get
```
This command will compile and run the app
```
flutter run
```
After executing this command, the application will be running on your emulator.

#### 4. Editing your project
See the [Dart](https://dart.dev/guides) and [Flutter](https://flutter.dev/docs) Docs.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)