<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NewsPressWebForm._Default" %>

<%--<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
     <%--<script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <%--<script src="Scripts/jquery-3.4.1.min.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    
</asp:Content>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        
    <div class="row">
        <div class="col-md-6">
            <h2>Categories</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Image</th>
                        <%--<th>Function</th>--%>
                    </tr>
                </thead>
                <tbody id="categories">
                    
                </tbody>
            </table>
        </div> 
        
        <%--<div class="col-md-6">
            <h2>Add Category</h2>
            <%--<asp:TextBox ID="Name" runat="server" CssClass="form-control" ></asp:TextBox>
            <asp:TextBox ID="Path" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="AddBtn" runat="server" Text="Add" CssClass="btn btn-primary" />
            <input class="form-control" id="Name" type="text"/>
            <input class="form-control" id="Path" type="text"/>
            <input type="submit" id="AddBtn" class="btn btn-primary" value="Add"/>
            <input type="submit" id="EditBtn" class="btn btn-success" value="Save"/>
            
        </div>--%>
    </div>

    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script type="text/javascript">
         var toChangeId;
         function getCategories() {
             $.getJSON("api/categories",
                 function (data) {
                     $('#categories').empty(); // Clear the table body.

                     // Loop through the list of categories.
                     $.each(data, function (key, val) {
                         // Add a table row for the category.
                         
                         var row = '<td name="Name" onclick=tdClick(event,' + val.Id + ')' + ' id=' + val.Id + '>' + val.Name + '</td><td name="Path" id=' + val.Id + '>' + val.ImagePath + '</td>';
                         
                         $('<tr/>', { html: row })  // Append the name.
                             .appendTo($('#categories'));
                     });
                 });
         }

         function tdClick(event, id) {
             //id = id + 1;
             window.location.href = "/CategoryItems?catId="+id;
             //event.stopPropagation()
         };
         function editClick(event, id) {
             toChangeId = id + 1;
             //alert(toChangeId);
             event.preventDefault();
             var x = document.getElementsByName('Name');
             var y = document.getElementsByName('Path');
             var c = "";
             var v = "";
             for (var i = 0; i < x.length; i++) {
                 if (x[i].id == id) {
                     c = x[i].innerHTML;
                 }
             }
             for (var i = 0; i < y.length; i++) {
                 if (y[i].id == id) {
                     v = y[i].innerHTML;
                 }
             }
             document.getElementById('Name').value = c;
             document.getElementById('Path').value = v;
             //event.stopPropagation()
         };

         function addCategory() {
             var insert = {};
             insert.Name = $("#Name").val();
             insert.ImagePath = $("#Path").val();
             
             $.ajax({
                 url: "https://localhost:44375/api/categories",
                 type: "POST",
                 contentType: "Application/json;charset=utf-8",
                 data: JSON.stringify(insert),
                 dataType: "json",
                 
                 success: function (res) {
                     getCategories();
                     alert(res);
                 }
             });
         }

         function updateCategory(id) {
             var update = {};
             update.Name = $("#Name").val();
             update.ImagePath = $("#Path").val();
             
             $.ajax({
                 url: "https://localhost:44375/api/categories/" + id,
                 type: "PUT",
                 contentType: "Application/json;charset=utf-8",
                 data: JSON.stringify(update),
                 dataType: "json",

                 success: function (res) {
                     getCategories();
                     //alert(res);
                 }
             });
         }

         function deleteClick(event, id) {
             event.preventDefault();
             var toDelete = id + 1;
             $.ajax({
                 url: "https://localhost:44375/api/categories/" + toDelete,
                 type: "DELETE",
                 
                 

                 success: function (res) {
                     getCategories();
                     //alert(res);
                 }
             });
         }

         //jQuery.noConflict();
         $(document).ready(function () {
             
             getCategories();

             $("#AddBtn").click(function (e) {
                 
                 addCategory();
                 
                 e.preventDefault();
                
             });

             $("#EditBtn").click(function (e) {

                 updateCategory(toChangeId);

                 e.preventDefault();

             });

             
         });

        //$(document).ready(getCategories);
     </script>



    <%--<div class="row">
        <div class="col-md-6">
            <h2>Categories</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
                    <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Edit" />
                    <asp:ButtonField ButtonType="Button" CommandName="Update" Text="Update" />
                    <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PressNewsConnectionString %>" DeleteCommand="DELETE FROM [Categories] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Categories] ([Id], [Name], [ImagePath]) VALUES (@Id, @Name, @ImagePath)" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [Name] = @Name, [ImagePath] = @ImagePath WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="ImagePath" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="ImagePath" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>     
        
        <div class="col-md-6">
            <h2>Add Categories</h2>
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Link"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
            <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PressNewsConnectionString %>" DeleteCommand="DELETE FROM [Categories] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Categories] ([Id], [Name], [ImagePath]) VALUES (@Id, @Name, @ImagePath)" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [Name] = @Name, [ImagePath] = @ImagePath WHERE [Id] = @Id" OnSelecting="SqlDataSource2_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter Name="Id" Type="Int32" ControlID="TextBox1" DbType="Int32" />
                    <asp:ControlParameter Name="Name" ControlID="TextBox1" Type="String" />
                    <asp:ControlParameter Name="ImagePath" ControlID="TextBox2" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="ImagePath" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>--%>

</asp:Content>
