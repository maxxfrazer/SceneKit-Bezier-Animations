// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SCNBezier",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(name: "SCNBezier", targets: ["SCNBezier"]),
  ],
  targets: [
    .target(name: "SCNBezier")
  ],
  swiftLanguageVersions: [
    .v5
  ]
)
