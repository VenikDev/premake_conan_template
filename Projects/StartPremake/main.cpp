#include <assert.h>

#include <iostream>
#include <fmt/format.h>

#include "types.h"

enum class Platform {
   WIN64
};

[[maybe_unused]] static Platform PlatformBuild() {
#ifdef _PLATFORM_WINDOW
   return Platform::WIN64;
#else
#error Unfinished type of platform
#endif
}

[[maybe_unused]] static const char* PlatformName() {
   switch (PlatformBuild()) {
      case Platform::WIN64:
         return "WIN64";
   }

   assert(false && "Platform type not found");
   return "ERROR";
}

enum class ConfigurationType {
   DEBUG,
   PROFILE,
   SHIPPING
};

[[maybe_unused]] static ConfigurationType ConfigurationBuild() {
#ifdef _SHIPPING
   return ConfigurationType::SHIPPING;
#elif _PROFILE
   return ConfigurationType::PROFILE;
#else
   return ConfigurationType::DEBUG;
#endif
}

[[maybe_unused]] static const char* ConfigurationName() {
   switch (ConfigurationBuild()) {
      case ConfigurationType::DEBUG:
         return "DEBUG";
      case ConfigurationType::PROFILE:
         return "PROFILE";
      case ConfigurationType::SHIPPING:
         return "SHIPPING";
   }

   assert(false && "Configuration type not found");
   return "ERROR";
}

int main() {
   float32_t i = 54.f;

   fmt::println("Configuration: {}", ConfigurationName());
   fmt::println("Platform: {}", PlatformName());

   return EXIT_SUCCESS;
}