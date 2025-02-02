#pragma once

#include <cmath>

class Vector2D {
public:
   Vector2D() : x(0), y(0) {
   }

   Vector2D(float x, float y) : x(x), y(y) {
   }

   Vector2D operator+(const Vector2D& other) const {
      return {x + other.x, y + other.y};
   }

   Vector2D operator-(const Vector2D& other) const {
      return {x - other.x, y - other.y};
   }

   Vector2D operator*(float scalar) const {
      return {x * scalar, y * scalar};
   }

   float Dot(const Vector2D& other) const {
      return x * other.x + y * other.y;
   }

   float Magnitude() const {
      return std::sqrt(x * x + y * y);
   }

   Vector2D Normalized() const {
      float mag = Magnitude();
      if (mag == 0) return {};
      return {x / mag, y / mag};
   }

public:
   float x, y;
};