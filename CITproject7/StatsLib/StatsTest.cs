using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace StatsLib
{
    [TestFixture]
    class StatsTest
    {
        //Test Mean calculates the mean of a given list of numbers. This method will be implmented by each test case in the third sprint.
        [Test]
        public void TestMean()
        {
            Stats s = new Stats();
            int[] numbers = new[] { 1, 2, 3, 4, 5 };
            double ans = s.Mean(numbers);

            Assert.AreEqual(ans, 3);
            Assert.AreNotEqual(ans, 7);
        }
        
        //Old style of testing. Changed in third sprint.
        //Test for Calculating Median for an odd amount of numbers in an array.
        [Test]
        public void median1()
        {
            Stats s = new Stats();
            Assert.AreEqual(6, s.Median1(3, 6, 7, 10, 2));
            Assert.AreNotEqual(4, s.Median1(3, 4, 5, 9, 43));
        }

        //Test for Calculating Median for an even amount of numbers in an array.
        [Test]
        public void median2()
        {
            Stats s = new Stats();
            Assert.AreEqual(6.5, s.Median2(3, 6, 7, 10));
            Assert.AreNotEqual(4, s.Median2(3, 4, 5, 9));
        }

        //Test for Calculating Max value in an array.
        [Test]
        public void Max()
        {
            Stats s = new Stats();
            Assert.AreEqual(22, s.Max(3, 22, 5, 6, 18));
            Assert.AreNotEqual(32, s.Max(3, 42, 45, 69, 23));
        }

        //Test for Calculating Min value in an array.
        [Test]
        public void Min()
        {
            Stats s = new Stats();
            Assert.AreEqual(3, s.Min(3, 5, 7, 22, 34, 12));
            Assert.AreNotEqual(23, s.Min(6, 4, 2, 78, 5, 3));
        }

        //Test for Calculating Mode value in an array.
        [Test]
        public void Mode()
        {
            Stats s = new Stats();
            Assert.AreEqual(2, s.Mode(1, 2, 2, 3, 4));
            Assert.AreNotEqual(3, s.Mode(1, 2, 2, 2, 3));
        }
    }
}

