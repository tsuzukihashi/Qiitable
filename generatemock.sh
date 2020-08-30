#!/bin/bash
if which mint >/dev/null; then
    rm -f $SRCROOT/MockResults.swift

# Repository
mint run mockolo mockolo --sourcedirs $SRCROOT/Domain/Repository --destination $SRCROOT/Mocks/RepositoryMockResults.swift

# UseCase
mint run mockolo mockolo --sourcedirs $SRCROOT/Domain/UseCase --destination $SRCROOT/Mocks/UseCaseMockResults.swift

# Router
mint run mockolo mockolo --sourcedirs $SRCROOT/Qiitable/Router --destination $SRCROOT/Mocks/RouterMockResults.swift

# Presenter
mint run mockolo mockolo --sourcedirs $SRCROOT/Qiitable/Presenter --destination $SRCROOT/Mocks/PresenterMockResults.swift

else
  echo "warning: Mint not installed, download from https://github.com/yonaskolb/Mint"
fi
