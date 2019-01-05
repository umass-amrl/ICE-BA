#include <cmath>
#include <stdio.h>
#include <iostream>

#include "gtest/gtest.h"

#include "Backend/Geometry/Rotation.h"

using std::cout;

static const float kEpsilon = 1e-10;

void PrintVector3(const LA::AlignedVector3f& v) {
  printf("[%f %f %f]\n", v.x(), v.y(), v.z());
}

void PrintMatrix3(const LA::AlignedMatrix3x3f& m) {
  printf("[%f %f %f\n", m.m00(), m.m01(), m.m02());
  printf(" %f %f %f\n", m.m10(), m.m11(), m.m12());
  printf(" %f %f %f]\n", m.m20(), m.m21(), m.m22());
}

TEST(Geometry, Primitives) {
  ASSERT_FLOAT_EQ(1.0f  , std::sin(M_PI_2));
}

TEST(Rotations, Rodrigues) {
  const LA::AlignedVector3f angle_axis(0, 0, 0.5);
  LA::AlignedMatrix3x3f jacobian;
  jacobian.MakeZero();
  Rotation3D::GetRodriguesJacobianInverse(angle_axis, jacobian, kEpsilon);
  printf("so(3): \n");
  PrintVector3(angle_axis);
  printf("J: \n");
  PrintMatrix3(jacobian);
  // Get the 3x3 matrix for the Jacobian of the rotation (in angle-axis form)
  //   of the relative rotation due to gyroscope drift.
  // Set it to the component of the Jacobian w.r.t. gyroscope bias.
  Rotation3D::GetRodriguesJacobian(angle_axis, jacobian, kEpsilon);
  printf("so(3): \n");
  PrintVector3(angle_axis);
  printf("J: \n");
  PrintMatrix3(jacobian);
}

int main(int argc, char* argv[]) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
