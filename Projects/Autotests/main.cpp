#include <gtest/gtest.h>
#include <gmock/gmock.h>

TEST(test, start) {
   EXPECT_EQ(3 * 3, 9);
}

int main(int argc, char** argv) {
   testing::InitGoogleMock(&argc, argv);
   testing::InitGoogleTest(&argc, argv);
   return RUN_ALL_TESTS();
}