using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Collectibles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnEditBooks_Click(object sender, EventArgs e)
    {
        this.Response.Redirect("EditBooks.aspx");
    }
}