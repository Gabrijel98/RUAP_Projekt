using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json.Linq;

namespace CarPredictionPrice
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LbReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void LbPredict_Click(object sender, EventArgs e)
        {
            var options = new RestClientOptions("https://ussouthcentral.services.azureml.net")
            {
                MaxTimeout = -1,
            };
            var client = new RestClient(options);
            var request = new RestRequest("/workspaces/18f5caef211b4e9c94f6047e3562730e/services/3ab4d39f9c8445b1bb369b7fd106ee13/execute?api-version=2.0&details=true", Method.Post);
            request.AddHeader("Authorization", "Bearer T/Xe+Ce5j9DZf3Tk9ibA4PyAnXrGJ0SZvVLwmzQy9on+9W6sH7yTP2LCsVts+vRLaeWY6Okm2I/B+AMCLElelg==");
            request.AddHeader("Content-Type", "application/json");
            string model = ddlModel.SelectedValue;
            string fuel = rblFuel.SelectedValue;
            string doors = rblDoors.SelectedValue;
            string bodycar = ddlBody.SelectedValue;
            string drive = rblDrive.SelectedValue;
            string weight = tbWeight.Text;
            string engineSize = tbEngineSize.Text;
            string bhp = tbBhp.Text;
            string mpg = tbMpg.Text;
            string budget = tbBudget.Text;
            var body = @"{
                ""Inputs"": {
                    ""input1"": {
                        ""ColumnNames"": [
                            ""normalized-losses"",
                            ""make"",
                            ""fuel"",
                            ""doors"",
                            ""body"",
                            ""drive"",
                            ""weight"",
                            ""engine-size"",
                            ""bhp"",
                            ""mpg"",
                            ""price""
                        ],
                        ""Values"": [
                            [
                                ""100"",
                                """ + model + @""",
                                """ + fuel + @""",
                                """ + doors + @""",
                                """ + bodycar + @""",
                                """ + drive + @""",
                                """ + weight + @""",
                                """ + engineSize + @""",
                                """ + bhp + @""",
                                """ + mpg + @""",
                                """ + budget + @"""
                            ]
                        ]
                    }
                },
                ""GlobalParameters"": {}
            }";
            request.AddStringBody(body, DataFormat.Json);
            RestResponse response = client.Execute(request);
            Console.WriteLine(response.Content);
            //lblResults.Text = response.Content.ToString();
            //{"Results":{"output1":{"type":"table","value":{"ColumnNames":["make","fuel","doors","body","drive","weight","engine-size","bhp","mpg","price","Scored Labels"],"ColumnTypes":["String","String","String","String","String","Int32","Int32","Int32","Int32","Int32","Double"],
            //"Values":[["alfa-romero","diesel","four","hardtop","fwd","2000","150","160","55","15000","14748.9994776615"]]}}}}
            var results = JObject.Parse(response.Content);
            string prediction = results["Results"]["output1"]["value"]["Values"][0][10].ToString();
            prediction = prediction.Split('.')[0];
            lblResults.Text = "Your estimated price for selected values is " + prediction + " dollars.";
            int predictedPrice = int.Parse(prediction);
            int userBudget = int.Parse(budget);

            if (predictedPrice > userBudget + 2000)
            {
                lblResults.Text += "<br />It's a lot more than you expected. Consider buying a car of lesser value.";
            }
            else if (predictedPrice > userBudget)
            {
                lblResults.Text += "<br />It's a bit more than you expected.";
            }
            else if (predictedPrice < userBudget - 2000)
            {
                lblResults.Text += "<br />It's way less than you expected. You can opt for a car of greater value. ";
            }
            else if (predictedPrice < userBudget)
            {
                lblResults.Text += "<br />It's a bit less than you expected.";
            }
        }
    }
}
