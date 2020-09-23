using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CITproject7
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string[] list = TextBox1.Text.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            int[] numbers = new int[list.Length];
            for (int i = 0; i < numbers.Length; i++)
            {
                numbers[i] = Convert.ToInt32(list[i].Trim());
            }


        }

        public int? FindMode(List<int> numbers)
        {


            if (numbers == null | numbers.Count == 0)
            {
                return null;
            }

            List<int> indices = new List<int>();
            numbers.Sort();



            //Calculate the Discrete derivative of the sample and record the indices
            //where it is positive.
            for (int i = 0; i < numbers.Count; i++)
            {
                int derivative;

                if (i == numbers.Count - 1)
                {
                    //This ensures that there is a positive derivative for the
                    //last item in the sample. Without this, the mode could not
                    //also be the largest value in the sample.
                    derivative = int.MaxValue - numbers[i];
                }
                else
                {
                    derivative = numbers[i + 1] - numbers[i];
                }

                if (derivative > 0)
                {
                    indices.Add(i + 1);
                }
            }

            int maxDerivative = 0, maxDerivativeIndex = -1;

            //Calculate the discrete derivative of the indices, recording its
            //maxima and index.
            for (int i = -1; i < indices.Count - 1; i++)
            {
                int derivative;

                if (i == -1)
                {
                    derivative = indices[0];
                }
                else
                {
                    derivative = indices[i + 1] - indices[i];
                }

                if (derivative > maxDerivative)
                {
                    maxDerivative = derivative;
                    maxDerivativeIndex = i + 1;
                }
            }

            //The mode is then the value of the sample indexed by the
            //index of the largest derivative.
            return numbers[indices[maxDerivativeIndex] - 1];
        }


    }
}