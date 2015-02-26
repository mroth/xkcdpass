# xkcdpass
xkcd style password generator for iOS.

![screenshot][screenshot]

Mostly just a demo project to teach myself Swift.

Based on this cartoon:
![xkcd-password-cartoon][original-cartoon]

xkcdpass uses a wordlist of the 10,000 most common English words, derived from the _Google Trillion Word Corpus_. Since the source is from Google, the results can occasionally be [slightly NSFW][nsfw-sample].

The word length and number of words is configurable in application settings, with results on passphrase entropy previewed.

![settings][settings]

[screenshot]: http://f.cl.ly/items/1Y3h3I2F1z0L0d3W0v2H/hang-garlic-bikes-watson.png
[original-cartoon]: http://imgs.xkcd.com/comics/password_strength.png
[nsfw-sample]: http://f.cl.ly/items/0i0k3F0z221s2C2f3E3S/spank-higher-task-bunny.png
[settings]: http://f.cl.ly/items/061K3T341S3q1o0b1j29/settings.png

## Installation

I have an ethical problem in paying Apple :money_with_wings: just to be able to give my software away for free, so this isn't currently available on the App Store.  If you want to send donations to me towards the $99 Apple Developer "registration fee", I happily will put this on the App Store for free!

paypal:
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4VVFSF8VPZTGQ"><img src="https://img.shields.io/badge/paypal-donate-red.svg"></a>  
gratipay:
<a href="https://gratipay.com/mroth/"><img src="https://img.shields.io/gratipay/mroth.svg"></a>

If you *do* have a valid developer certificate, you should be able to clone this repo and install locally on your device.

## License
This application is all rights reserved (for now).  I will likely put a nonrestrictive license on it like all my other software if I find a way to put it on the App Store.

Contains the [xkcd-font][font], which is Creative Commons Attribution-NonCommercial 3.0 License.

Wordlist derived from the [google-10000-english][wordlist] corpus, Linguistic Data Consortium.

[font]: https://github.com/ipython/xkcd-font
[wordlist]: https://github.com/first20hours/google-10000-english
