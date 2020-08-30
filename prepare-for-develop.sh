#/bin/sh

#brew
if !(type "brew" > /dev/null 2>&1); then
    echo "brew is not install. install homebrew. plz wait..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

#carthage
if !(type "carthage" > /dev/null 2>&1); then
    echo "carthage is not install. install carthage. plz wait..."
    brew install carthage
fi

brew outdated carthage || brew upgrade carthage

carthage bootstrap --platform ios --cache-builds

#mint
if !(type "mint" > /dev/null 2>&1); then
    echo "not install mint"
    brew install mint
fi

mint bootstrap

exit 0
