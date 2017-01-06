using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class BuyShares : System.Web.UI.Page
{
    string[] symbol = new string[] { "BRK-A", "BOJA", "CSCO", "WEN", "MCD" };
    string[] company = new string[] {"Berkshire Hathaway Inc",
                                     "Bojangles Inc",
                                     "Cisco Systems Inc",
                                     "The Wendy's Company",
                                     "McDonald's Corporation"};
    string[] price = new string[] { "$244,309.98", "$18.70", "$30.34", "$13.37", "$119.33" };
    string[] logo = new string[] {"~/Images/berkshirelogo.jpg",
                                  "~/Images/bojangleslogo.png",
                                  "~/Images/ciscologo.gif",
                                  "~/Images/wendyslogo.png",
                                  "~/Images/mcdonaldslogo.png"};

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 0; i <= 4; i++)
            {
                drpBuyShares.Items.Add(symbol[i] + "  " + company[i]);
            }

            lblSharePrice.Text = price[0];

            for (int i = 100; i <= 1000; i += 100)
            {
                drpShares.Items.Add(i.ToString());
            }

        }

        drpShares.SelectedIndex = 0;
    }

    
    protected void NavigationButtons_Command(object sender, CommandEventArgs e)
    {
        switch(e.CommandName)
        {
            case "First":
                this.GoToFirstRow();
                break;
            case "Previous":
                this.GoToPreviousRow();
                break;
            case "Next":
                this.GoToNextRow();
                break;
            case "Last":
                this.GoToLastRow();
                break;
        }
                
    }

    protected void GoToFirstRow()
    {
        drpBuyShares.SelectedIndex = 0;
        drpBuyShares_SelectedIndexChanged(null, null);
    }

    protected void GoToPreviousRow()
    {
        if ((drpBuyShares.SelectedIndex) > 0) drpBuyShares.SelectedIndex = (drpBuyShares.SelectedIndex) - 1;
        drpBuyShares_SelectedIndexChanged(null, null);
    }

    protected void GoToNextRow()
    {
        if ((drpBuyShares.SelectedIndex) < 4) drpBuyShares.SelectedIndex = (drpBuyShares.SelectedIndex) + 1;
        drpBuyShares_SelectedIndexChanged(null, null);
    }

    protected void GoToLastRow()
    {
        drpBuyShares.SelectedIndex = 4;
        drpBuyShares_SelectedIndexChanged(null, null);
    }

    protected void drpBuyShares_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSharePrice.Text = price[drpBuyShares.SelectedIndex];
        ChangeImage();
     
    }

    protected void ChangeImage()
    {
        imgLogo.Src = logo[drpBuyShares.SelectedIndex];
    }


    protected void btnAddToCart_Click(object sender, EventArgs e)
    {

    }
}