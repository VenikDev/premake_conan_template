#pragma once

#include <cstdint>

#if defined(__clang__)
#define PRAGMA_OPTIMIZE_ON _Pragma("clang optimize on")
#define PRAGMA_OPTIMIZE_OFF _Pragma("clang optimize off")

#define PRAGMA_DIAGNOSTIC_IGNORE_CLANG_ON(WARN) \
_Pragma("clang diagnostic push")                \
_Pragma(dsPP_STRINGIFY(clang diagnostic ignored WARN))

#define PRAGMA_DIAGNOSTIC_IGNORE_CLANG_OFF _Pragma("clang diagnostic pop")
#else
#define PRAGMA_OPTIMIZE_ON _Pragma("optimize( \"\", on )")
#define PRAGMA_OPTIMIZE_OFF _Pragma("optimize( \"\", off )")

#define PRAGMA_DIAGNOSTIC_IGNORE_CLANG_ON(WARN)
#define PRAGMA_DIAGNOSTIC_IGNORE_CLANG_OFF
#endif

using int8 = int8_t;
using int16 = int16_t;
using int32 = int32_t;
using int64 = int64_t;

using uint8 = uint8_t;
using uint16 = uint16_t;
using uint32 = uint32_t;
using uint64 = uint64_t;

// Character and string types
using ANSICHAR = char; // ASCII/UTF-8 character
using WIDECHAR = wchar_t; // UTF-16/UTF-32 depending on platform
using TCHAR = WIDECHAR; // Basic Character Type UE
using UTF8CHAR = char8_t; // C++20 UTF‑8
using UTF16CHAR = char16_t; // UTF‑16
using UTF32CHAR = char32_t; // UTF‑32

// Удобные алиасы‑синонимы
using BYTE = uint8;
using WORD = uint16;
using DWORD = uint32;
using QWORD = uint64;