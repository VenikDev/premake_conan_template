from conan import ConanFile
from conan.tools.premake import PremakeDeps

class StartPremake(ConanFile):
    settings = "os", "arch", "compiler", "build_type"
    requires = (
        "fmt/11.1.1",
        "gtest/1.15.0",
        "benchmark/1.9.1",
    )

    def generate(self):
        premake = PremakeDeps(self)
        premake.generate()
