# SwiftyLisk

SwiftyLisk allows you to add blockchain functionalities to any Swift app for iOS and macOS alike.

## Requirements

- iOS >= 8.0 || macOS >= 10.10 || tvOS >= 9.0+ || watchOS >= 2.0
- Xcode >= 8.1
- Swift >= 3

## Integration

1. Close your Xcode project
2. Make sure CocoaPods is installed on your machine by running `pod --version` on the Terminal. If you get `-bash: pod: command not found`, please follow CocoaPods' [installation guide](https://guides.cocoapods.org/using/getting-started.html)
3. `cd` to the directory containing your project's `xcodeproj` directory
4. Add CocoaPods to your project by running `pod init`
5. Open the newly created `Podfile`
6. Ensure `use_frameworks!` is specified
7. Add the following pods:
    - `pod 'SwiftyJSON'`
    - `pod 'Alamofire'`
8. Save and close `Podfile`
9. Install the newly specified pods by running `pod install`
10. Open the newly created `YOUR_PROJECT.xcworkspace` (*not* `YOUR_PROJECT.xcodeproj`)
11. Drag and drop the `Lisk` directory into your project's navigator (shortcut to show the navigator: `Command-1`)
12. Build the project (shortcut: `Command-B`)

## Usage

The Lisk API is composed of eight modules:

- AccountAPI
- BlockAPI
- DelegateAPI
- LoaderAPI
- MultisignatureAPI
- PeerAPI
- SignatureAPI
- TransactionAPI

Every available method is implemented as a class method. At the moment the Wiki for SwiftyLisk is not ready. Please refer to the comments preceding each method for documentation. Also, notice that SwiftyLisk implements all methods available in the [Lisk API Reference](https://github.com/LiskArchive/lisk-wiki/wiki/Lisk-API-Reference), so, as a rule of thumb, to use a method from the reference reference type `MODULE_NAME + API.METHOD_NAME`. (Note: a few methods have been renamed to make code more readable.)

## Support

SwiftyLisk is maintained by LiskUser1234 ([Lisk Forum](https://forum.lisk.io/memberlist.php?mode=viewprofile&u=1265), [Reddit](https://www.reddit.com/user/LiskUser1234/)).

To ensure SwiftyLisk a future, please consider voting LiskUser1234 for delegate on the Lisk mainnet.

For donations, these are SwiftyLisk's addresses:

- Bitcoin: [1NCTZwBJF7ZFpwPeQKiSgci9r2pQV3G7RG](bitcoin://1NCTZwBJF7ZFpwPeQKiSgci9r2pQV3G7RG)
- Lisk: [6137947831033853925L](lisk://6137947831033853925L)

Thank you for your support.
