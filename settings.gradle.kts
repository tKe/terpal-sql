includeBuild("terpal-sql-core")
includeBuild("terpal-sql-jdbc")

rootProject.name = "terpal-sql"

pluginManagement {
  repositories {
    gradlePluginPortal()
    mavenCentral()
    mavenLocal()
  }
}

