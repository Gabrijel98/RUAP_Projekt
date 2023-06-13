<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarPredictionPrice.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: left;
            background-color: lightgrey;
        }

        .image-container {
            position: absolute;
            top: 10px;
            right: 10px;
            max-width: 400px; 
            max-height: 400px; 
            overflow: hidden;
        }

        .image-container img {
                width: 100%;
                height: 100%;
                object-fit: contain;
        }

         .image-container-left {
            position: absolute;
            top: 10px;
            left: 10px;
            max-width: 200px; 
            max-height: 200px; 
            overflow: hidden;
        }

        .image-container-left img {
                width: 100%;
                height: 100%;
                object-fit: contain;
        }

        .predict-button {
        display: inline-block;
        margin-top: 2em;
        padding: 10px 20px;
        border: 2px solid #fff;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        color: #000;
    }

    .predict-button:hover {
        background-color: #fff;
        color: #000;
        text-decoration: none;
    }

    .predict-cell {
    text-align: right;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Car Price Prediction Calculator</h1>
        </div>
        <table>
            <tr>
                <td>Model:</td>
                <td><asp:DropDownList ID="ddlModel" runat="server">
                        <asp:ListItem>alfa-romero</asp:ListItem>
                        <asp:ListItem>audi</asp:ListItem>
                        <asp:ListItem>bmw</asp:ListItem>
                        <asp:ListItem>chevrolet</asp:ListItem>
                        <asp:ListItem>dodge</asp:ListItem>
                        <asp:ListItem>honda</asp:ListItem>
                        <asp:ListItem>isuzu</asp:ListItem>
                        <asp:ListItem>jaguar</asp:ListItem>
                        <asp:ListItem>mazda</asp:ListItem>
                        <asp:ListItem>mercedes-benz</asp:ListItem>
                        <asp:ListItem>mitsubishi</asp:ListItem>
                        <asp:ListItem>nissan</asp:ListItem>
                        <asp:ListItem>peugot</asp:ListItem>
                        <asp:ListItem>plymouth</asp:ListItem>
                        <asp:ListItem>porsche</asp:ListItem>
                        <asp:ListItem>renault</asp:ListItem>
                        <asp:ListItem>saab</asp:ListItem>
                        <asp:ListItem>subaru</asp:ListItem>
                        <asp:ListItem>toyota</asp:ListItem>
                        <asp:ListItem>volkswagen</asp:ListItem>
                        <asp:ListItem>volvo</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>Fuel type:</td>
                <td><asp:RadioButtonList ID="rblFuel" runat="server">
                        <asp:ListItem Value="unleaded">petrol</asp:ListItem>
                        <asp:ListItem>diesel</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
             <tr>
                <td>Doors:</td>
                <td><asp:RadioButtonList ID="rblDoors" runat="server">
                        <asp:ListItem>two</asp:ListItem>
                        <asp:ListItem>four</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
             <tr>
                <td>Body:</td>
                <td><asp:DropDownList ID="ddlBody" runat="server">
                        <asp:ListItem>convertible</asp:ListItem>
                        <asp:ListItem>hardtop</asp:ListItem>
                        <asp:ListItem>hatchback</asp:ListItem>
                        <asp:ListItem>saloon</asp:ListItem>
                        <asp:ListItem>wagon</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
             <tr>
                <td>Drive:</td>
                <td><asp:RadioButtonList ID="rblDrive" runat="server">
                        <asp:ListItem Value="4wd">all wheel drive</asp:ListItem>
                        <asp:ListItem Value="fwd">front wheel drive</asp:ListItem>
                        <asp:ListItem Value="rwd">rear wheel drive</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>Weight (in lbs):</td>
                <td><asp:TextBox ID="tbWeight" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Engine-size:</td>
                <td><asp:TextBox ID="tbEngineSize" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>BHP:</td>
                <td><asp:TextBox ID="tbBhp" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>MPG:</td>
                <td><asp:TextBox ID="tbMpg" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Budget:</td>
                <td><asp:TextBox ID="tbBudget" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:LinkButton ID="lbReset" runat="server" OnClick="LbReset_Click" CssClass="predict-button">Reset</asp:LinkButton></td>
                <td class="predict-cell">
                <asp:LinkButton ID="lbPredict" runat="server" OnClick="LbPredict_Click" CssClass="predict-button">Predict</asp:LinkButton></td>
                </tr>
            </table>
         <asp:Label ID="lblResults" runat="server" Font-Size="Large"></asp:Label>
         <div class="image-container">
             <img src="Maple-Car-Price-Blog.png" alt="Image" />
        </div>
        <div class="image-container-left">
             <img src="ferit_logo.png" alt="Image" />
        </div>
        <div style="position: absolute; bottom: 10px; right: 10px;">
        <asp:Label ID="lblLabel" runat="server" Text="Made by: D.Ćaleta, I.Momić, G.Krilčić & E.Borovac"></asp:Label>
        </div>
    </form>
</body>
</html>
