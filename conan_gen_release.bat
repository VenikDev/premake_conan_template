@echo off

conan install .\conanfile.py --profile:build=./Conan/Profiles/windows_release_x64_profile --profile:host=./Conan/Profiles/windows_release_x64_profile --output=./Conan --build=*
