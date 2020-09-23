using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoreLinq;

namespace StatsLib
{
    public class Stats
    {
        //Invoking Method through Nunit Library. This style will be implemented for each method in the third sprint.

        //Code to Calculate the Mean of an array of Numbers
        public double Mean(int [] numbers)
        {
            double total = 0;
            for(int i = 0; i < numbers.Length; i++)
            {
                total += numbers[i];
            }

            return total / numbers.Length;
        }
        
        //Orginal Method of running Nunit tests alongside method in each class. Implement above function to each method for next sprint.
        
        //Code to Calculate the Median of an array which has an odd amount of Numbers.
        public int Median1(int n1, int n2, int n3, int n4, int n5)
        {
            int[] numbers = { n1, n2, n3, n4, n5 };
            Array.Sort(numbers);
            int numberCount = numbers.Length;

            if (numberCount % 2 == 0)
            {
                // count is even, average two middle elements
                int a = numbers[numberCount / 2 - 1];
                int b = numbers[numberCount / 2];
                decimal result = (a + b) / 2m;
                return Convert.ToInt32(result);
            }
            else
            {
                // count is odd, return the middle element
                decimal result = numbers[numberCount / 2];
                return Convert.ToInt32(result);
            }
        }

        //Code to Calculate the Median of an array which has an even amount of Numbers.
        public double Median2(int n1, int n2, int n3, int n4)
        {
            int[] numbers = { n1, n2, n3, n4 };
            Array.Sort(numbers);
            int numberCount = numbers.Length;

            if (numberCount % 2 == 0)
            {
                // count is even, average two middle elements
                int a = numbers[numberCount / 2 - 1];
                int b = numbers[numberCount / 2];
                decimal result = (a + b) / 2m;
                return Convert.ToDouble(result);
            }
            else
            {
                // count is odd, return the middle element
                decimal result = numbers[numberCount / 2];
                return Convert.ToInt32(result);
            }
        }


        //Code to Calculate the Max amount in an array of numbers.
        public int Max(int n1, int n2, int n3, int n4, int n5)
        {
            int[] numbers = { n1, n2, n3, n4, n5 };
            Array.Sort(numbers);
            int numberCount = numbers.Length;

            int max = numbers.Max();

            return max;
        }

        //Code to Calculate the Minimum amount in an array of numbers.
        public int Min(int n1, int n2, int n3, int n4, int n5, int n6)
        {
            int[] numbers = { n1, n2, n3, n4, n5, n6 };
            Array.Sort(numbers);
            int numberCount = numbers.Length;

            int min = numbers.Min();

            return min;
        }

        //Code to Calculate the Mode in an array of numbers.
        //Install-Package morelinq -Version 3.0.0 need to download package to get the mode to work. MaxBy relies on this.
        public int Mode(int n1, int n2, int n3, int n4, int n5)
        {
            int[] numbers = { n1, n2, n3, n4, n5 };
            Array.Sort(numbers);
            var mode = numbers.GroupBy(n => n)
            .MaxBy(g => g.Count())
            .Select(g => g.Key);

            var result = Convert.ToInt32(string.Join(",", mode.Select(z => z.ToString())));

            return result;


        }

    }
}
