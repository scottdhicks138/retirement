using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Stocks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("Symbol", typeof(string)));
        dt.Columns.Add(new DataColumn("Name", typeof(string)));
        dt.Columns.Add(new DataColumn("Shares", typeof(string)));
        dt.Columns.Add(new DataColumn("Value", typeof(string)));
        dt.Columns.Add(new DataColumn("Total", typeof(string)));
        dr = dt.NewRow();
        dr["Symbol"] = "MCD";
        dr["Name"] = "McDonalds";
        dr["Shares"] = "1000";
        dr["Value"] = "$100.00";
        dr["Total"] = "$100,000.00";

        dt.Rows.Add(dr);

        ViewState["CurrentTable"] = dt;

        grdStocks.DataSource = dt;
        grdStocks.DataBind();
        lblPortfolioValue.Text = "$100,000.00";
    }

    protected void btnBuyShares_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/BuyShares.aspx");
    }
}