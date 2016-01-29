# OCLint Homebrew Formulae

[Homebrew][] formulae repo for OCLint packages.

[homebrew]: http://brew.sh/

## Usage

### Install

```console
$ brew tap oclint/formulae
$ brew install oclint
```

And can be simplified to

```console
$ brew install oclint/formulae/oclint
```

### Update

To update the brew package, use brew update first:

```console
$ brew update
$ brew upgrade oclint
```

### Travis CI
According to Travis CI OS X image [bootstrap script](https://github.com/travis-infrastructure/osx-image-bootstrap/blob/master/bootstrap.sh), OCLint version will be fixed to the time that particular image is generated. Travis CI support confirmed that it usually be the same day as Apple releases a new version of Xcode. So the OCLint version included in the Travis CI image should be updated or recent.

When OCLint has updates between two Xcode releases, Travis CI may or may not generate a new OS X image with the up-to-date OCLint version. When that happens, please add the followings to your `before_install` configurations (**unverified**, provided by Travis CI support):

```yaml
before_install:
- brew update
- brew unlink brew-cask && brew install caskroom/cask/brew-cask
- brew cask install oclint
```

Or from this tap, as in [this example](https://github.com/ryuichis/oclint-objc-travis-ci-examples):

```yaml
before_install:
- brew cask uninstall oclint
- brew tap oclint/formulae
- brew install oclint
```
