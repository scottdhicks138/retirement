using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            for (int i = 50; i <= 500; i += 50)
            {
                drpInvestment.Items.Add(i.ToString());
            }
    }

    public void btnCalculate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            //SiteMaster.ChangeImage("~/Images/MovingBen.gif");
            decimal beginBalance = Convert.ToDecimal(txtBegBal.Text);
            int monthlyInvestment = Convert.ToInt32(drpInvestment.SelectedValue);
            decimal yearlyInterestRate = Convert.ToDecimal(txtInterest.Text);
            int years = Convert.ToInt32(txtYears.Text);
            lblText.Text = "Future Value";
            decimal futureValue = this.CalculateFutureValue(beginBalance, monthlyInvestment, yearlyInterestRate, years);
            lblValue.Text = futureValue.ToString("C");
        }
    }

    protected decimal CalculateFutureValue(decimal beginBalance, int monthlyInvestment, decimal yearlyInterestRate, int years)
    {
        HtmlImage img = Master.FindControl("changingImage") as HtmlImage;
        img.Src = "~/Images/MovingBen.gif";
        int months = years * 12;
        decimal monthlyInterestRate = yearlyInterestRate / 12 / 100;
        decimal futureValue = beginBalance;

        for (int i = 0; i < months; i++)
        {
            futureValue = (futureValue + monthlyInvestment) * (1 + monthlyInterestRate);
        }

        return futureValue;
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        HtmlImage img = Master.FindControl("changingImage") as HtmlImage;
        img.Src = "~/Images/BenjaminFranklin.png";
        txtBegBal.Text = "";
        drpInvestment.SelectedIndex = 0;
        txtInterest.Text = "";
        txtYears.Text = "";
        lblText.Text = "";
        lblValue.Text = "";
    }
        
}