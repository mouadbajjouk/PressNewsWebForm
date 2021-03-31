<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NewsPressWebForm.WebForm1" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <%--<input type="text" class="form-control" id="inputEmail3" placeholder="Email"/>--%>
                <asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;</div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password"/>--%>
                <asp:TextBox class="form-control" ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;</div>
        </div>
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="Button1" runat="server" Text="Sign in" class="btn btn-default" OnClick="Button1_Click"/>
            </div>
        </div>
</asp:Content>
