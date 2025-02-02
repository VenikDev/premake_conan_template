#pragma once

#include <cmath>

class Vector3D {
public:
   Vector3D() : x(0), y(0), z(0) {
   }

   Vector3D(float x, float y, float z) : x(x), y(y), z(z) {
   }

   Vector3D operator+(const Vector3D& other) const {
      return {x + other.x, y + other.y, z + other.z};
   }

   Vector3D operator-(const Vector3D& other) const {
      return {x - other.x, y - other.y, z - other.z};
   }

   Vector3D operator*(float scalar) const {
      return {x * scalar, y * scalar, z * scalar};
   }

   float Dot(const Vector3D& other) const {
      return x * other.x + y * other.y + z * other.z;
   }

   Vector3D Cross(const Vector3D& other) const {
      return {
         y * other.z - z * other.y,
         z * other.x - x * other.z,
         x * other.y - y * other.x
      };
   }

   float Magnitude() const {
      return std::sqrt(x * x + y * y + z * z);
   }

   Vector3D Normalized() const {
      float mag = Magnitude();
      if (mag == 0) return {};
      return {x / mag, y / mag, z / mag};
   }

public:
   float x, y, z;
};