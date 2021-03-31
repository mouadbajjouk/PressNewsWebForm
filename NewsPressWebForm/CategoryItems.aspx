<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryItems.aspx.cs" Inherits="NewsPressWebForm.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-6">
            <h2>Items</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Text</th>
                        <th>Date</th>
                        <th>Link</th>
                        <%--<th>Function</th>--%>
                    </tr>
                </thead>
                <tbody id="Items">
                </tbody>
            </table>
        </div>

        <%--<div class="col-md-6">
            <h2>Add Item</h2>
            <label>Name</label>
            <input class="form-control" id="Name" type="text"/>
            <label>Text</label>
            <input class="form-control" id="Text" type="text"/>
            <label>Date</label>
            <input class="form-control" id="Date" type="text"/>
            <label>LinkUrl</label>
            <input class="form-control" id="LinkUrl" type="text"/>
            <input type="submit" id="AddBtn" class="btn btn-primary" value="Add"/>
            <input type="submit" id="EditBtn" class="btn btn-success" value="Save"/>
        </div>--%>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script type="text/javascript">
         var url = new URL(window.location.href);
         var id = url.searchParams.get("catId");
         var toChangeId;
         //alert(id);

         function getItems(id) {
             url = "api/items?catId=" + id;
             $.getJSON(url,
                 function (data) {
                     $('#Items').empty(); // Clear the table body.

                     // Loop through the list of categories.
                     $.each(data, function (key, val) {
                         // Add a table row for the category.

                         var row = '<td name="Name"' + 'id=' + key + '>' + val.Name + '</td><td name="Text"' + 'id=' + key + '>' + val.Text + '</td><td name="Date"' + 'id=' + key + '>' + val.Date + '</td><td name="LinkUrl"' + 'id=' + key + '>'  + val.LinkUrl + '</td>';

                         $('<tr/>', { html: row })  // Append the name.
                             .appendTo($('#Items'));
                     });
                 });
         }

         function addItem() {
             var insert = {};
             insert.Name = $("#Name").val();
             insert.Text = $("#Text").val();
             insert.Date = $("#Date").val();
             insert.LinkUrl = $("#LinkUrl").val();
             insert.CategoryId = id;

             $.ajax({
                 url: "https://localhost:44375/api/items",
                 type: "POST",
                 contentType: "Application/json;charset=utf-8",
                 data: JSON.stringify(insert),
                 dataType: "json",

                 success: function (res) {
                     getItems(id);
                     //alert(res);
                 }
             });
         }

         function editClick(event, id) {
             toChangeId = id;
             //alert(toChangeId);
             event.preventDefault();
             var x = document.getElementsByName('Name');
             var y = document.getElementsByName('Text');
             var z = document.getElementsByName('Date');
             var t = document.getElementsByName('LinkUrl');
             var c = "";
             var v = "";
             var b = "";
             var n = "";

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
             for (var i = 0; i < z.length; i++) {
                 if (z[i].id == id) {
                     b = z[i].innerHTML;
                 }
             }
             for (var i = 0; i < t.length; i++) {
                 if (t[i].id == id) {
                     n = t[i].innerHTML;
                 }
             }
             document.getElementById('Name').value = c;
             document.getElementById('Text').value = v;
             document.getElementById('Date').value = b;
             document.getElementById('LinkUrl').value = n;
             //event.stopPropagation()
         };

         function updateItem(idI) {
             var update = {};
             update.Name = $("#Name").val();
             update.Text = $("#Text").val();
             update.Date = $("#Date").val();
             update.LinkUrl = $("#LinkUrl").val();

             $.ajax({
                 url: "https://localhost:44375/api/items/" + idI,
                 type: "PUT",
                 contentType: "Application/json;charset=utf-8",
                 data: JSON.stringify(update),
                 dataType: "json",

                 success: function (res) {
                     getItems(id);
                     //alert(res);
                 }
             });
         }

         function deleteClick(event, idI) {
             event.preventDefault();
             var toDelete = idI + 1;
             $.ajax({
                 url: "https://localhost:44375/api/items/" + toDelete,
                 type: "DELETE",



                 success: function (res) {
                     getItems(id);
                     //alert(res);
                 }
             });
         }

         $(document).ready(function () {
             
             getItems(id);

             $("#AddBtn").click(function (e) {
                 
                 addItem();

                 e.preventDefault();
                 getItems(id);

             });

             $("#EditBtn").click(function (e) {

                 updateItem(toChangeId);

                 e.preventDefault();

             });

         });
     </script>

</asp:Content>
